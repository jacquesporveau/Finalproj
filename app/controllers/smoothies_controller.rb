class SmoothiesController < ApplicationController
  def index
  end

  def nutritionaljson
    render json: {
    'width' => 280,
    'showServingUnitQuantity' => false,
    'itemName' => 'Dog shit',
    'ingredientList' => 'Dog shit',

    'showPolyFat' => false,
    'showMonoFat' => false,

    'valueCalories' => 450,
    'valueFatCalories' => 430,
    'valueTotalFat' => 48,
    'valueSatFat' => 6,
    'valueTransFat' => 0,
    'valueCholesterol' => 30,
    'valueSodium' => 780,
    'valueTotalCarb' => 3,
    'valueFibers' => 0,
    'valueSugars' => 3,
    'valueProteins' => 3,
    'valueVitaminA' => 0,
    'valueVitaminC' => 0,
    'valueCalcium' => 0,
    'valueIron' => 0
  }
  end
end