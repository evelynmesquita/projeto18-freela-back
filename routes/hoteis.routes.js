import {Router} from 'express'
import { listaHoteisCidade, hotelDetalhes } from '../controllers/hoteis.controller.js'

const hoteisCidadeRoutes = Router();

hoteisCidadeRoutes.get("/hoteis/:cidadeId", listaHoteisCidade);
hoteisCidadeRoutes.get("/hoteis/detalhes/:hotelId", hotelDetalhes);

export default hoteisCidadeRoutes;