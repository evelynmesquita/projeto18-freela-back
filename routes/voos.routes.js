import {Router} from 'express'
import { voosCidade, vooDetalhes } from '../controllers/voos.controller.js'

const voosCidadeRouter = Router();

voosCidadeRouter.get("/voos/:cidadeId", voosCidade);
voosCidadeRouter.get("/voos/detalhes/:vooId", vooDetalhes);

export default voosCidadeRouter;