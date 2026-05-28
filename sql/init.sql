CREATE DATABASE airflow;
CREATE DATABASE skins_analytics;

\c skins_analytics;
CREATE TYPE skins_wear AS ENUM ('Battle-Scarred', 'Well-Worn', 'Field-Tested', 'Minimal Wear', 'Factory New');

CREATE TABLE IF NOT EXISTS skin (
    id                  SERIAL PRIMARY KEY,
    market_hash_name    VARCHAR(255) NOT NULL,
    wear                skins_wear NOT NULL,
    is_stattrak         BOOLEAN NOT NULL DEFAULT false,
    UNIQUE (market_hash_name, wear, is_stattrak)
);

CREATE TABLE IF NOT EXISTS market_value (
    id                  SERIAL PRIMARY KEY,
    skin_id             INTEGER NOT NULL REFERENCES skin(id),
    market_name         VARCHAR(50) NOT NULL,
    mean_price          NUMERIC(12, 2) NOT NULL,
    min_price           NUMERIC(12, 2) NOT NULL,
    max_price           NUMERIC(12, 2) NOT NULL,
    median_price        NUMERIC(12, 2) NOT NULL,
    volume              INTEGER,
    fetched_at          TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);
