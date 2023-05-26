import { db } from "../database/database.connection.js";

export const listaCidades = async (req, res) => {
    try {
        const query = 'SELECT * FROM cidades';
        const { rows } = await db.query(query);
        res.send(rows);
    } catch (error) {
        res.status(500).send('Erro ao obter a lista de cidades');
    }
};