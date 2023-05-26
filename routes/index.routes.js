import { Router } from "express";
import cidadesRoutes from "./cidades.routes.js";
import hoteisCidadeRoutes from "./hoteis.routes.js"
import voosCidadeRouter from "./voos.routes.js";
import passagensRoutes from "./passagens.routes.js";

const router = Router();
router.use(cidadesRoutes);
router.use(hoteisCidadeRoutes);
router.use(voosCidadeRouter);
router.use(passagensRoutes);

export default router;