hw01-josh-seo
================
Josh Seo
2/23/18

HW1\_Part 1: Data Dictionary
----------------------------

    Title: 1985 Auto Imports Database
    Source Information: 
    Creator/Donor: Jeffrey C. Schlimmer (Jeffrey.Schlimmer@a.gp.cs.cmu.edu)
      Date: 19 May 1987
      Sources:
         1) 1985 Model Import Car and Truck Specifications, 1985 Ward's
            Automotive Yearbook.
         2) Personal Auto Manuals, Insurance Services Office, 160 Water
            Street, New York, NY 10038 
         3) Insurance Collision Report, Insurance Institute for Highway
            Safety, Watergate 600, Washington, DC 20037

    Variables:
      Quantitative Variables: Wheel Base, Length, Width, Height, Curb Weight, Engine Size, Bore,                                  Stroke, Compression Ratio, Horsepower, Peak RPM, City MPG, 
                              Highway MPG, Price
      Qualitative Variables: Symboling, Normalized Losses, Make, Fuel Type, Aspriation, 
                              Number of Doors, Body Style, Drive Wheels, Number of Cylinders, 
                              Fuel System
      Class of Variables:
              Double: symboling, wheel base, length, width, height, bore, stroke, compression ratio
              Integer: curb weight, engine size, horsepower, peak rpm, city mpg, highway mpg, price
              Character: normalized losses, make, fuel type, aspiration, number of doors, 
              body style, drive wheels, engine location, engine type, number of cylinders, 
              fuel system
    
    Codification Environment:
      turbo.data: data frame includes all information of vehicles with engine type = "turbo"
      qdat: data frame includes all quantitative information
      Bottom10_citympg.data: data frame that includes all information of vehicles lies under bottom 
                            10th percentile in city mpg category
      PoV: Proportion of Variation
      cum_sum: cumulative sum of PoV
      matrix: a table indicating eigenvalues, PoV in %, and cum_sum in %
      PoV_rounded: rounded at two-decimal-point.
      pca_prcomp: Principal Components Analysis on the data.
      
