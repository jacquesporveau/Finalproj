class SmoothiesController < ApplicationController
  protect_from_forgery
  def index
  end

  def nutritional
    @fruit = params[:fruit]
    @veg = params[:veg]
    @liquid = params[:liquid]
    @seednut = params[:seednut]
    @herb = params[:herb]
  end

  def nutritionaljson
    # FRUIT VARIABLES


    @sat_fatfruit = Food.where(Name: params["fruit"]).limit(1).pluck(:SaturatedFats)
    @trans_fatfruit = Food.where(Name: params["fruit"]).limit(1).pluck(:Trans)
    @fatfruit = @trans_fatfruit[0] + @sat_fatfruit[0]
    @ingredientfruit = Food.where(Name: params["fruit"]).limit(1).pluck(:Name)
    @potassiumfruit = Food.where(Name: params["fruit"]).limit(1).pluck(:Potassium)
    @carbsfruit = Food.where(Name: params["fruit"]).limit(1).pluck(:Carbohydrate)
    @proteinfruit = Food.where(Name: params["fruit"]).limit(1).pluck(:Protein)
    # Calories = Carbs * 4 + Fat * 9 + Protein * 4
    @calsfruit = (@carbsfruit[0] * 4) + (@fatfruit * 9) + (@proteinfruit[0] * 4)
    @cals_from_fatfruit = @fatfruit * 9
    @cholesterolfruit = Food.where(Name: params["fruit"]).limit(1).pluck(:Cholesterol)
    @sodiumfruit = Food.where(Name: params["fruit"]).limit(1).pluck(:Sodium)
    @fibersfruit = Food.where(Name: params["fruit"]).limit(1).pluck(:Fiber)
    @sugarsfruit = Food.where(Name: params["fruit"]).limit(1).pluck(:Sugars)

    @vitCfruit = Food.where(Name: params["fruit"]).limit(1).pluck(:VitaminC)
    @vitAfruit = Food.where(Name: params["fruit"]).limit(1).pluck(:VitaminA_IU)
    @calciumfruit = Food.where(Name: params["fruit"]).limit(1).pluck(:Calcium)
    @ironfruit = Food.where(Name: params["fruit"]).limit(1).pluck(:Iron)


    # VEGGIE VARAIBLES


    @sat_fatveg = Food.where(Name: params["veg"]).limit(1).pluck(:SaturatedFats)
    @trans_fatveg = Food.where(Name: params["veg"]).limit(1).pluck(:Trans)
    @fatveg = @trans_fatveg[0] + @sat_fatveg[0]
    @ingredientveg = Food.where(Name: params["veg"]).limit(1).pluck(:Name)
    @potassiumveg = Food.where(Name: params["veg"]).limit(1).pluck(:Potassium)
    @carbsveg = Food.where(Name: params["veg"]).limit(1).pluck(:Carbohydrate)
    @proteinveg = Food.where(Name: params["veg"]).limit(1).pluck(:Protein)
    # Calories = Carbs * 4 + Fat * 9 + Protein * 4
    @calsveg = (@carbsveg[0] * 4) + (@fatveg * 9) + (@proteinveg[0] * 4)
    @cals_from_fatveg = @fatveg * 9
    @cholesterolveg = Food.where(Name: params["veg"]).limit(1).pluck(:Cholesterol)
    @sodiumveg = Food.where(Name: params["veg"]).limit(1).pluck(:Sodium)
    @fibersveg = Food.where(Name: params["veg"]).limit(1).pluck(:Fiber)
    @sugarsveg = Food.where(Name: params["veg"]).limit(1).pluck(:Sugars)

    @vitCveg = Food.where(Name: params["veg"]).limit(1).pluck(:VitaminC)
    @vitAveg = Food.where(Name: params["veg"]).limit(1).pluck(:VitaminA_IU)
    @calciumveg = Food.where(Name: params["veg"]).limit(1).pluck(:Calcium)
    @ironveg = Food.where(Name: params["veg"]).limit(1).pluck(:Iron)


    # LIQUID VARIABLES


    @sat_fatliquid = Food.where(Name: params["liquid"]).limit(1).pluck(:SaturatedFats)
    @trans_fatliquid = Food.where(Name: params["liquid"]).limit(1).pluck(:Trans)
    @fatliquid = @trans_fatliquid[0] + @sat_fatliquid[0]
    @ingredientliquid = Food.where(Name: params["liquid"]).limit(1).pluck(:Name)
    @potassiumliquid = Food.where(Name: params["liquid"]).limit(1).pluck(:Potassium)
    @carbsliquid = Food.where(Name: params["liquid"]).limit(1).pluck(:Carbohydrate)
    @proteinliquid = Food.where(Name: params["liquid"]).limit(1).pluck(:Protein)
    # Calories = Carbs * 4 + Fat * 9 + Protein * 4
    @calsliquid = (@carbsliquid[0] * 4) + (@fatliquid * 9) + (@proteinliquid[0] * 4)
    @cals_from_fatliquid = @fatliquid * 9
    @cholesterolliquid = Food.where(Name: params["liquid"]).limit(1).pluck(:Cholesterol)
    @sodiumliquid = Food.where(Name: params["liquid"]).limit(1).pluck(:Sodium)
    @fibersliquid = Food.where(Name: params["liquid"]).limit(1).pluck(:Fiber)
    @sugarsliquid = Food.where(Name: params["liquid"]).limit(1).pluck(:Sugars)

    @vitCliquid = Food.where(Name: params["liquid"]).limit(1).pluck(:VitaminC)
    @vitAliquid = Food.where(Name: params["liquid"]).limit(1).pluck(:VitaminA_IU)
    @calciumliquid = Food.where(Name: params["liquid"]).limit(1).pluck(:Calcium)
    @ironliquid = Food.where(Name: params["liquid"]).limit(1).pluck(:Iron)


    # SEED/NUT VARIABLES


    @sat_fatseednut = Food.where(Name: params["seednut"]).limit(1).pluck(:SaturatedFats)
    @trans_fatseednut = Food.where(Name: params["seednut"]).limit(1).pluck(:Trans)
    @fatseednut = @trans_fatseednut[0] + @sat_fatseednut[0]
    @ingredientseednut = Food.where(Name: params["seednut"]).limit(1).pluck(:Name)
    @potassiumseednut = Food.where(Name: params["seednut"]).limit(1).pluck(:Potassium)
    @carbsseednut = Food.where(Name: params["seednut"]).limit(1).pluck(:Carbohydrate)
    @proteinseednut = Food.where(Name: params["seednut"]).limit(1).pluck(:Protein)
    # Calories = Carbs * 4 + Fat * 9 + Protein * 4
    @calsseednut = (@carbsseednut[0] * 4) + (@fatseednut * 9) + (@proteinseednut[0] * 4)
    @cals_from_fatseednut = @fatseednut * 9
    @cholesterolseednut = Food.where(Name: params["seednut"]).limit(1).pluck(:Cholesterol)
    @sodiumseednut = Food.where(Name: params["seednut"]).limit(1).pluck(:Sodium)
    @fibersseednut = Food.where(Name: params["seednut"]).limit(1).pluck(:Fiber)
    @sugarsseednut = Food.where(Name: params["seednut"]).limit(1).pluck(:Sugars)

    @vitCseednut = Food.where(Name: params["seednut"]).limit(1).pluck(:VitaminC)
    @vitAseednut = Food.where(Name: params["seednut"]).limit(1).pluck(:VitaminA_IU)
    @calciumseednut = Food.where(Name: params["seednut"]).limit(1).pluck(:Calcium)
    @ironseednut = Food.where(Name: params["seednut"]).limit(1).pluck(:Iron)


    #HERB


    @sat_fatherb = Food.where(Name: params["herb"]).limit(1).pluck(:SaturatedFats)
    @trans_fatherb = Food.where(Name: params["herb"]).limit(1).pluck(:Trans)
    @fatherb = @trans_fatherb[0] + @sat_fatherb[0]
    @ingredientherb = Food.where(Name: params["herb"]).limit(1).pluck(:Name)
    @potassiumherb = Food.where(Name: params["herb"]).limit(1).pluck(:Potassium)
    @carbsherb = Food.where(Name: params["herb"]).limit(1).pluck(:Carbohydrate)
    @proteinherb = Food.where(Name: params["herb"]).limit(1).pluck(:Protein)
    # Calories = Carbs * 4 + Fat * 9 + Protein * 4
    @calsherb = (@carbsherb[0] * 4) + (@fatherb * 9) + (@proteinherb[0] * 4)
    @cals_from_fatherb = @fatherb * 9
    @cholesterolherb = Food.where(Name: params["herb"]).limit(1).pluck(:Cholesterol)
    @sodiumherb = Food.where(Name: params["herb"]).limit(1).pluck(:Sodium)
    @fibersherb = Food.where(Name: params["herb"]).limit(1).pluck(:Fiber)
    @sugarsherb = Food.where(Name: params["herb"]).limit(1).pluck(:Sugars)

    @vitCherb = Food.where(Name: params["herb"]).limit(1).pluck(:VitaminC)
    @vitAherb = Food.where(Name: params["herb"]).limit(1).pluck(:VitaminA_IU)
    @calciumherb = Food.where(Name: params["herb"]).limit(1).pluck(:Calcium)
    @ironherb = Food.where(Name: params["herb"]).limit(1).pluck(:Iron)



    render json: {
      'width' => 280,
      'showServingUnitQuantity' => false,
      'itemName' => 'Smoothie',
      'ingredientList' => @ingredientfruit + @ingredientveg + @ingredientliquid + @ingredientseednut +@ingredientherb,

      'showPolyFat' => false,
      'showMonoFat' => false,

      'valuePotassium' => @potassiumfruit[0] + @potassiumveg[0] + @potassiumliquid[0] + @potassiumseednut[0] + @potassiumherb[0],
      'valueCalories' => @calsfruit + @calsveg + @calsliquid + @calsseednut + @calsherb,
      'valueFatCalories' => @cals_from_fatfruit + @cals_from_fatveg + @cals_from_fatliquid + @cals_from_fatseednut + @cals_from_fatherb,
      'valueTotalFat' => @sat_fatfruit[0] + @trans_fatfruit[0] + @sat_fatveg[0] + @trans_fatveg[0] + @sat_fatliquid[0] + @trans_fatliquid[0] + @sat_fatseednut[0] + @trans_fatseednut[0] + @sat_fatherb[0] + @trans_fatherb[0],
      'valueSatFat' => @sat_fatfruit[0] + @sat_fatveg[0] + @sat_fatliquid[0] + @sat_fatseednut[0] + @sat_fatherb[0],
      'valueTransFat' => @trans_fatfruit[0] + @trans_fatveg[0] + @trans_fatliquid[0] + @trans_fatseednut[0] + @trans_fatherb[0],
      'valueCholesterol' => @cholesterolfruit[0] + @cholesterolveg[0] + @cholesterolliquid[0] + @cholesterolseednut[0] + @cholesterolherb[0],
      'valueSodium' => @sodiumfruit[0] + @sodiumveg[0] + @sodiumliquid[0] + @sodiumseednut[0] + @sodiumherb[0],
      'valueTotalCarb' => @carbsfruit[0] + @carbsveg[0] + @carbsliquid[0] + @carbsseednut[0] + @carbsherb[0],
      'valueFibers' => @fibersfruit[0] + @fibersveg[0] + @fibersliquid[0] + @fibersseednut[0] + @fibersherb[0],
      'valueSugars' => @sugarsfruit[0] + @sugarsveg[0] + @sugarsliquid[0] + @sugarsseednut[0] + @sugarsherb[0],
      'valueProteins' => @proteinfruit[0] + @proteinveg[0] + @proteinliquid[0] + @proteinseednut[0] + @proteinherb[0],
      'valueVitaminA' => ((@vitAfruit[0] + @vitAveg [0]+ @vitAliquid[0] + @vitAseednut[0] + @vitAherb[0]) / 3000) * 100,
      'valueVitaminC' => ((@vitCfruit[0] + @vitCveg[0] + @vitCliquid[0] + @vitCseednut[0] + @vitCherb[0]) / 85) * 100,
      'valueCalcium' => ((@calciumfruit[0] + @calciumveg[0] + @calciumveg[0] + @calciumseednut[0] + @calciumherb[0]) / 1000) * 100,
      'valueIron' => ((@ironfruit[0] + @ironveg[0] + @ironliquid[0] + @ironseednut[0] + @ironherb[0]) / 16) * 100
    }
  end
end