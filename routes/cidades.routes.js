import {Router} from 'express'
import { listaCidades } from '../controllers/cidades.controller.js'

const cidadesRoute = Router();

cidadesRoute.get("/cidades", listaCidades);

export default cidadesRoute;