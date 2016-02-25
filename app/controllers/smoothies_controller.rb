class SmoothiesController < ApplicationController
  def index
  end

  def nutritionaljson

    @carbs = Nutrient.where(name: 'Carbohydrate, by difference').limit(1).pluck(:value)
    @fat = Nutrient.where(name: 'Total lipid (fat)').limit(1).pluck(:value)
    @protein = Nutrient.where(name: 'Protein').limit(1).pluck(:value)
    # Calories = Carbs * 4 + Fat * 9 + Protein * 4
    @cals = (@carbs[0] * 4) + (@fat[0] * 9) + (@protein[0] * 4)
    @cals_from_fat = @fat[0] * 9
    @vitC = Nutrient.where(name: 'Vitamin C, total ascorbic acid').limit(1).pluck(:value)
    @vitA = Nutrient.where(name: 'Vitamin A, IU').limit(1).pluck(:value)
    @calcium = Nutrient.where(name: 'Calcium, Ca').limit(1).pluck(:value)
    @iron = Nutrient.where(name: 'Iron, Fe').limit(1).pluck(:value)

    render json: {
    'width' => 280,
    'showServingUnitQuantity' => false,
    'itemName' => 'Smoothie',
    'ingredientList' => "dog shit",
    'showPolyFat' => false,
    'showMonoFat' => false,

    'valuePotassium' => Nutrient.where(name: 'Potassium, K').limit(1).pluck(:value),
    'valueCalories' => @cals,
    'valueFatCalories' => @cals_from_fat,
    'valueTotalFat' => @fat,
    'valueSatFat' => 0,
    'valueTransFat' => 0,
    'valueCholesterol' => Nutrient.where(name: 'Cholesterol').limit(1).pluck(:value),
    'valueSodium' => Nutrient.where(name: 'Sodium, Na').limit(1).pluck(:value),
    'valueTotalCarb' => Nutrient.where(name: 'Carbohydrate, by difference').limit(1).pluck(:value),
    'valueFibers' => Nutrient.where(name: 'Fiber, total dietary').limit(1).pluck(:value),
    'valueSugars' => Nutrient.where(name: 'Sugars, total').limit(1).pluck(:value),
    'valueProteins' => @protein,
    'valueVitaminA' => (@vitA[0].to_f / 3000) * 100,
    'valueVitaminC' => (@vitC[0].to_f / 85) * 100,
    'valueCalcium' => (@calcium[0].to_f / 1000) * 100,
    'valueIron' => (@iron[0].to_f / 16) * 100
  }
  end
end