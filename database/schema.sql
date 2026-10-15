CREATE TABLE IF NOT EXISTS products(id TEXT PRIMARY KEY,name TEXT NOT NULL,description TEXT NOT NULL DEFAULT '',price_paise INTEGER NOT NULL CHECK(price_paise>0),image_url TEXT NOT NULL DEFAULT '',category TEXT NOT NULL DEFAULT 'lifestyle',active BOOLEAN NOT NULL DEFAULT TRUE,created_at TIMESTAMPTZ NOT NULL DEFAULT NOW());
ALTER TABLE products ADD COLUMN IF NOT EXISTS category TEXT NOT NULL DEFAULT 'lifestyle';
CREATE TABLE IF NOT EXISTS orders(id TEXT PRIMARY KEY,razorpay_order_id TEXT UNIQUE,customer_name TEXT NOT NULL,customer_email TEXT NOT NULL,customer_phone TEXT NOT NULL,items JSONB NOT NULL,amount_paise INTEGER NOT NULL CHECK(amount_paise>0),currency TEXT NOT NULL DEFAULT 'INR',status TEXT NOT NULL DEFAULT 'created' CHECK(status IN('created','paid','failed')),razorpay_payment_id TEXT UNIQUE,created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),paid_at TIMESTAMPTZ,delivery_address TEXT,delivery_city TEXT,delivery_state TEXT,delivery_pincode TEXT);
CREATE INDEX IF NOT EXISTS orders_created_at_idx ON orders(created_at DESC);
INSERT INTO products(id,name,description,price_paise,image_url,category,active) VALUES
('xe-tote','Everyday Canvas Tote','A practical carry-all for everyday essentials.',49900,'https://images.unsplash.com/photo-1590874103328-eac38a683ce7?auto=format&fit=crop&w=900&q=85','accessories',TRUE),
('xe-watch','Classic Minimal Watch','A clean, understated everyday timepiece.',129900,'https://images.unsplash.com/photo-1524805444758-089113d48a6d?auto=format&fit=crop&w=900&q=85','accessories',TRUE),
('xe-headphones','Wireless Headphones','A comfortable, minimal audio companion.',199900,'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=900&q=85','electronics',TRUE),
('xe-notebook','Everyday Notebook','A simple place for notes, plans and ideas.',29900,'https://images.unsplash.com/photo-1531346878377-a5be20888e57?auto=format&fit=crop&w=900&q=85','stationery',TRUE),
('xe-sunglasses','Mono Sunglasses','A timeless silhouette for sunny days.',79900,'https://images.unsplash.com/photo-1511499767150-a48a237f0083?auto=format&fit=crop&w=900&q=85','accessories',TRUE),
('xe-speaker','Compact Bluetooth Speaker','Small footprint, everyday sound.',149900,'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?auto=format&fit=crop&w=900&q=85','electronics',TRUE)
ON CONFLICT(id) DO NOTHING;
