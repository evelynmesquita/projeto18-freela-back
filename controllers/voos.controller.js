import { db } from "../database/database.connection.js";

export const voosCidade = async (req, res) => {
    try {
        const cidadeId = req.params.cidadeId;
        const { minPrice, maxPrice } = req.query;
        let query =
            `SELECT voos.*, origem.nome AS cidade_origem, destino.nome AS cidade_destino, companhias_aereas.nome AS companhia_aerea
            FROM voos
            JOIN cidades AS origem ON voos.cidade_origem_id = origem.id
            JOIN cidades AS destino ON voos.cidade_destino_id = destino.id
            JOIN companhias_aereas ON voos.companhia_aerea_id = companhias_aereas.id
            WHERE voos.cidade_destino_id = $1`;

        const values = [cidadeId];

        if (minPrice && maxPrice) {
            query += ' AND voos.preco >= $2 AND voos.preco <= $3';
            values.push(minPrice, maxPrice);
        } else if (minPrice) {
            query += ' AND voos.preco >= $2';
            values.push(minPrice);
        } else if (maxPrice) {
            query += ' AND voos.preco <= $2';
            values.push(maxPrice);
        }

        const { rows } = await db.query(query, values);
        res.send(rows);
    } catch (error) {
        console.error('Erro ao obter a lista de passagens:', error);
        res.status(500).send('Erro ao obter a lista de passagens');
    }
};

export const vooDetalhes = async (req, res) => {
    try {
        const vooId = req.params.vooId;
        const query =
            'SELECT voos.*, origem.nome AS cidade_origem, destino.nome AS cidade_destino, companhias_aereas.nome AS companhia_aerea ' +
            'FROM voos ' +
            'JOIN cidades AS origem ON voos.cidade_origem_id = origem.id ' +
            'JOIN cidades AS destino ON voos.cidade_destino_id = destino.id ' +
            'JOIN companhias_aereas ON voos.companhia_aerea_id = companhias_aereas.id ' +
            'WHERE voos.id = $1';
        const values = [vooId];

        const { rows } = await db.query(query, values);
        res.send(rows[0]);
    } catch (error) {
        console.error('Erro ao obter os detalhes da passagem:', error);
        res.status(500).send('Erro ao obter os detalhes da passagem');
    }
};