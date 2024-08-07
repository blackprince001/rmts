SET standard_conforming_strings = ON;
CREATE SCHEMA IF NOT EXISTS spatial_data;
DROP TABLE IF EXISTS "spatial_data"."buildings" CASCADE;
BEGIN;
CREATE TABLE "spatial_data"."buildings"();
ALTER TABLE "spatial_data"."buildings" ADD COLUMN "ogc_fid" SERIAL CONSTRAINT "buildings_pk" PRIMARY KEY;
SELECT AddGeometryColumn('spatial_data','buildings','wkb_geometry',4326,'POLYGON',2);
ALTER TABLE "spatial_data"."buildings" ADD COLUMN "name" VARCHAR(80);
CREATE INDEX "buildings_wkb_geometry_geom_idx" ON "spatial_data"."buildings" USING GIST ("wkb_geometry");
COMMIT;