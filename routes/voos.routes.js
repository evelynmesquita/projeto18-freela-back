import {Router} from 'express'
import { voosCidade, vooDetalhes, inserirVoo } from '../controllers/voos.controller.js'

const voosCidadeRouter = Router();

voosCidadeRouter.get("/voos/:cidadeId", voosCidade);
voosCidadeRouter.get("/voos/detalhes/:vooId", vooDetalhes);
voosCidadeRouter.post("/voos", inserirVoo);

export default voosCidadeRouter;