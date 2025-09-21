-- Switch to the master database to perform database-level operations
USE master;
GO

-- Check if the database 'DataWarehouse2' exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse2')
BEGIN
    -- Force disconnect all users and drop the database
    ALTER DATABASE DataWarehouse2 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse2;
END
GO

-- Create a fresh database
CREATE DATABASE DataWarehouse2;
GO

-- Switch context to the newly created database
USE DataWarehouse2;
GO

-- Create schemas for data staging and refinement layers
CREATE SCHEMA bronze;  -- Raw ingestion layer
GO

CREATE SCHEMA silver;  -- Cleaned and transformed layer
GO

CREATE SCHEMA gold;    -- Final curated layer for reporting/analytics
GO
