# Load in LAD Dataset
lad <- geojsonio::geojson_read("https://opendata.arcgis.com/datasets/ae90afc385c04d869bc8cf8890bd1bcd_3.geojson",
                               what = "sp")

# Switch to preferred axis
lad <- sp::spTransform(lad, sp::CRS("+init=epsg:27700"))

# Subset to England only
lad <- subset(lad, substr(lad17cd,0,1) == "E")

#Fortify for use with ggplot2
lad_df <- ggplot2::fortify(lad, region = "lad17cd")

readr::write_csv(lad_df, "Data/lad_df.csv")