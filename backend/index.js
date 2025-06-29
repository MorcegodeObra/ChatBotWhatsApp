import express from 'express';
import { sequelize } from './src/config/sequelize.js';
import routerBot from './src/router/router.js';
import { configDotenv } from 'dotenv';
import cors from 'cors';
import {servicoCobranca} from './src/functions/mensagens/controladorMensagens.js';
import {verificaEmail} from "./src/functions/mensagens/verificaRespostas.js";
import { sendWeeklySummaries } from './src/functions/mensagens/resumoSemanal.js';

const app = express();
const PORT = 3000;

configDotenv();
app.use(cors());
app.use(express.json());
app.use(routerBot);

// Autenticação com PostgreSQL
sequelize.authenticate()
  .then(() => console.log('Conexão com PostgreSQL foi bem-sucedida! 🚀'))
  .catch(err => {
    console.error('Erro ao conectar no PostgreSQL:', err);
    process.exit(1); // Encerra o servidor caso a conexão falhe
  });

verificaEmail.start();
servicoCobranca.start();
sendWeeklySummaries.start();

// Sincronizar DB e iniciar servidor
sequelize.sync({alter:true}).then(() => {
  app.listen(PORT, () => {
    console.log(`Servidor rodando em http://localhost:${PORT}`);
  });
});
