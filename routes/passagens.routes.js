import {Router} from 'express'
import { inserirPassagens } from '../controllers/passagens.controller.js'

const passagensRoutes = Router();

passagensRoutes.post("/passagens", inserirPassagens);

export default passagensRoutes;