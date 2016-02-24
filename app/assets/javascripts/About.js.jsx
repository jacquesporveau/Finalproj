var About = React.createClass({
  render: function() {
    return (
      <div className="about-contain">
        <h1>How Healthy Is Your Smoothie?</h1>
        <p>We all have that one smoothie recipe we love. It's the one you'll have for breakfast, after a workout, or even for dinner if the mood is right.  But is your favourite recipe truly healthy?</p>
        <p>Many are surprised to hear that the smoothies they make at home, or even the ones they buy in-store, aren't as healthy as they think. People are cutting corners... and missing out on the good stuff! Put in your recipe on the right, and you'll get:</p>
        <div className="about-bottom">
          <ul>
            <li>A grade for your recipe based on our proprietary database and algorithm</li>
            <li>Some of our favourite A+ smoothie recipes</li>
            <li>Nutrition tips from award-winning Smoothie Veggies dietitian, Diana Steele</li>
          </ul>
          <p>Want to get an A? Here's a hint: make sure it has veggies!</p>
        </div>
      </div>
    )
  }
})