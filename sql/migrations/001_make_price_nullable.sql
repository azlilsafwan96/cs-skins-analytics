\c skins_analytics;

ALTER TABLE market_value
    ALTER COLUMN mean_price     DROP NOT NULL,
    ALTER COLUMN min_price      DROP NOT NULL,
    ALTER COLUMN max_price      DROP NOT NULL,
    ALTER COLUMN median_price   DROP NOT NULL;