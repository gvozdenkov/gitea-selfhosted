SELECT 'CREATE DATABASE drone'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'drone')\gexec
