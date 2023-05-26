import { db } from "../database/database.connection.js";

export const inserirPassagens = async (req, res) => {
  try {
    const { voo_id, cidade_origem_id, cidade_destino_id, horario_partida, horario_chegada, nome_passageiro, assento } = req.body;
    const query =
      `INSERT INTO passagens (voo_id, cidade_origem_id, cidade_destino_id, horario_partida, horario_chegada, nome_passageiro, assento) 
      VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *`;

    const values = [voo_id, cidade_origem_id, cidade_destino_id, horario_partida, horario_chegada, nome_passageiro, assento];
    const { rows } = await db.query(query, values);
    res.send(rows[0]);
  } catch (error) {
    console.error('Erro ao adicionar passagem:', error);
    res.status(500).send('Erro ao adicionar passagem');
  }
};
