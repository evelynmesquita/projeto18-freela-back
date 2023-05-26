import { db } from "../database/database.connection.js";

export const listaHoteisCidade = async (req, res) => {
    try {
        const cidadeId = req.params.cidadeId;
        const { minPrice, maxPrice } = req.query;
        let query = `
            SELECT hoteis.*, cidades.nome AS cidade FROM hoteis
            JOIN cidades ON hoteis.cidade_id = cidades.id 
            WHERE hoteis.cidade_id = $1;`
        const values = [cidadeId];

        if (minPrice && maxPrice) {
            query += ' AND preco_diaria >= $2 AND preco_diaria <= $3';
            values.push(minPrice, maxPrice);
        } else if (minPrice) {
            query += ' AND preco_diaria >= $2';
            values.push(minPrice);
        } else if (maxPrice) {
            query += ' AND preco_diaria <= $2';
            values.push(maxPrice);
        }

        const { rows } = await db.query(query, values);
        res.send(rows);
    } catch (error) {
        console.error('Erro ao obter a lista de hospedagens:', error);
        res.status(500).json({ error: 'Erro ao obter a lista de hospedagens' });
    }
};

export const hotelDetalhes = async (req, res) => {
    try {
        const hotelId = req.params.hotelId;
        const query =
            `SELECT hoteis.*, cidades.nome AS cidade, comodidades.nome AS comodidade
            FROM hoteis
            JOIN cidades ON hoteis.cidade_id = cidades.id 
            JOIN hotel_comodidades ON hoteis.id = hotel_comodidades.hotel_id
            JOIN comodidades ON hotel_comodidades.comodidade_id = comodidades.id
            WHERE hoteis.id = $1`;
            
        const values = [hotelId];

        const { rows } = await db.query(query, values);
        const hotel = {
            id: rows[0].id,
            nome: rows[0].nome,
            descricao: rows[0].descricao,
            fotos: rows[0].foto,
            preco_diaria: rows[0].preco_diaria,
            comodidades: rows.map((row) => row.comodidade),
        };
        res.send(hotel);
    } catch (error) {
        console.error('Erro ao obter os detalhes da hospedagem:', error);
        res.status(500).send('Erro ao obter os detalhes da hospedagem');
    }
};