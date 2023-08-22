/**
 * Required External Modules
 */
import path from 'path';
import express, { Express, ErrorRequestHandler, Request, Response } from 'express';
import dotenv from 'dotenv';
import cookieParser from 'cookie-parser';
import cors from 'cors';
import helmet from 'helmet';

dotenv.config();

const PORT: number = parseInt(process.env.PORT as string, 10);
const app: Express = express();

/**
 *  App Configuration
 */
app.use(cookieParser());
app.use(helmet());
app.use(cors());
app.use(express.json());


app.use(express.static('build'));
app.get('*', (req, res) => {
  res.sendFile(__dirname + '/build/index.html');
});
// app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocs));

app.listen(PORT, () => {
  console.log(`⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️⚡️[server]: Server is running at http://localhost:${PORT}`);
});