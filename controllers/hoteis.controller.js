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

