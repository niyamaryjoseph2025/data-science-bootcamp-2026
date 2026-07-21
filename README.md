1. **Dataset overview**- Worked on the Netflix Movies and TV Shows dataset to find trends and data analysis.

2. **Business problem**
Predict whether a title is a Movie or TV Show based on its attributes.
Recommend content to users based on genre, duration, or release year.
Analyze content trends across countries and years to support Netflix's content acquisition strategy.
Identify the factors that influence the popularity and diversity of Netflix's catalog.

3.**ML problem framing**
A classification model can be developed to predict whether a title belongs to the Movie or TV Show category using features such as duration, country, release year, rating, and listed genres.

Other possible ML approaches include:

Clustering: Group similar content based on genres, duration, and ratings.
Recommendation Systems: Suggest similar content to users based on content characteristics.

4. **Target variable & key features**
   Target Variable:
type (Movie / TV Show)

Key Features:

title
director
cast
country
release_year
rating

5. **Three key observations**
Several columns such as director, cast, and country contain missing values and require preprocessing before model building.
The Netflix catalog contains significantly more Movies than TV Shows.
Most of the content was released in recent years, indicating that Netflix primarily focuses on relatively newer titles.

