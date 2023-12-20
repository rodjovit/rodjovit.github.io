# rodjovit.github.io

## Techinical Portfolio by Rodjovit Ramos
This is a technical portfolio of work that I have done in regards to programming and data science concepts.

## [Kaggle What's Cooking Contest](https://github.com/rodjovit/rodjovit.github.io/tree/3e36df2b5a2acb123fc3d627e60d0a498a536a40/kaggle_whats_cooking)
This project was done for a Kaggle Contest. In short, the task was to create a machine learning model that would predict the nationality of a dish given it's ingredients. There was a training and testing dataset provided. In order to accomplish this task, I decided to implement a K-Nearest Neighbor model using sklearn. Also, I decided to implement some other clustering models such as HDBSCAN, Gaussian Mixture, Spectral Clustering and Birch to test accuracies, but ultimately ended up using K-Nearest Neighbor.

![alt text](https://github.com/rodjovit/rodjovit.github.io/blob/3e36df2b5a2acb123fc3d627e60d0a498a536a40/img/kag1.png)

After testing the model on the testing dataset, the overall accuracy of the model was 82%. To test similarities between nationality dishes, I also implemented a confusion matrix from sklearn.

![alt text](https://github.com/rodjovit/rodjovit.github.io/blob/3e36df2b5a2acb123fc3d627e60d0a498a536a40/img/kag2.png)

## [2018 VAST MC3 Project](https://github.com/rodjovit/rodjovit.github.io/tree/4b49415e6f39fa94aa3cdc2609671dd8e7fd0fb1/2018VAST_MC3)
Utilizing data visualization tools such as Tableau and D3, the purpose of this project was to:
 -analyze company interactions over time including calls, emails, meetings, and purchases
 -analyze "suspicious" company interactions over time (given a separate flagged dataset)
 -identify additional "suspicious" employees not outlined in the briefing dossier
 -identify "suspicious" subgroups within the company based on interactions
 
![alt text](https://github.com/rodjovit/rodjovit.github.io/blob/3e36df2b5a2acb123fc3d627e60d0a498a536a40/img/vastss1.png)

Using OpenRefine and Pandas, I was able to clean and transform the data into a useable form for Tableau and D3. After cleaning the large datasets, I used data visualization tools to not only analyze company interactions over time, but also the suspicious interactions over time, as well as identify an additional "suspicious" employee and map out their methods of interactions. I was also able to identify changes in their interactions that corroborated with the timing of the investigation.

![alt text](https://github.com/rodjovit/rodjovit.github.io/blob/main/img/vastss2.png)

## [Steam Reviews Analysis Project](https://github.com/rodjovit/rodjovit.github.io/tree/3e36df2b5a2acb123fc3d627e60d0a498a536a40/steam_reviews_analysis)
This project utilized concepts of data mining, data cleaning, and machine learning to predict probabilities of games being good or bad given a word based on Steam data. This data was gathered using the Steam API in Python, cleaned using Pandas and OpenRefine, and used a classical Naive Bayes model to predict the probability that a game will be good or bad given a word. The output is a table that lists the amount of occurrences in good and badly reviewed games, the total amount of occurrences, and the probabilities they will be in a good or bad game, as well as the probability a game will be good given the word. Further work could include allowing for input to test different combinations of titles/genres.

![alt text](https://github.com/rodjovit/rodjovit.github.io/blob/3e36df2b5a2acb123fc3d627e60d0a498a536a40/img/ste2.png)

## Machine Learning
### [Multinomial Naive Bayes Classification](https://github.com/rodjovit/rodjovit.github.io/tree/c4a8da6adbdecd1073fa5fe0d2f64a2d4af84bf0/multinomialNB_tweets)

![alt text](https://github.com/rodjovit/rodjovit.github.io/blob/c4a8da6adbdecd1073fa5fe0d2f64a2d4af84bf0/img/mnb1.png)

The purpose of this project was to implement a machine learning model to classify the sentiment of tweets. The dataset given needed to be cleaned and trasnformed (done with Python) into a useable form before being fed to the model. The classification model chosen for this application was the Multinomial Naive Bayes Classification model using the sklearn module, and classifies tweets as positive or negative based on the context. As a result, the model was able to classify the tweets with accuracy.

### [K Means Clustering](https://github.com/rodjovit/rodjovit.github.io/tree/c4a8da6adbdecd1073fa5fe0d2f64a2d4af84bf0/kMeansClustering_articles)

![alt text](https://github.com/rodjovit/rodjovit.github.io/blob/c4a8da6adbdecd1073fa5fe0d2f64a2d4af84bf0/img/kmeans1.png)

The purpose of this project was to implement a machine learning model to cluster cleaned article data. The clustering model chosen for this application was the K Means Clustering model using the sklearn model and clusters articles based on their Term Frequency/Inverse Document Frequency (TFIDF) vector value and it's distance from the centroid TFIDF value. As a result, the model was able to cluster the articles with accuracy.

## Data Mining
### [CNN Scraper](https://github.com/rodjovit/rodjovit.github.io/tree/c4a8da6adbdecd1073fa5fe0d2f64a2d4af84bf0/cnn_scraper)

![alt text](https://github.com/rodjovit/rodjovit.github.io/blob/main/img/scraper2.png)

The purpose of this project was to scrape linkes, headlines, published dates, authors, and article content from CNN, more specifically the Science and Tech genres. Utilizing BeautifulSoup to parse the HTML, I was able to scrape articles (limited for ethical reasons) and prepare them for sentiment analysis using Python.

![alt text](https://github.com/rodjovit/rodjovit.github.io/blob/main/img/scraper1.png)

## Data Cleaning
### [Article Cleaner](https://github.com/rodjovit/rodjovit.github.io/tree/c4a8da6adbdecd1073fa5fe0d2f64a2d4af84bf0/text_cleaner)

This project is part of the article analysis project. This stage of the analysis utilized the Natural Language Toolkit (nltk) library to parse through the strings and clean the data. Removing stopwords, stemming and lemmatizing words, and converting symbols into text was done in Python in order to prepare the data for analysis. 

Alternatively, for H1 and H2, an underline-ish style:

Alt-H1
======

Alt-H2

Emphasis, aka italics, with *asterisks* or _underscores_.

Strong emphasis, aka bold, with **asterisks** or __underscores__.

Combined emphasis with **asterisks and _underscores_**.

Strikethrough uses two tildes. ~~Scratch this.~~

1. First ordered list item
2. Another item
⋅⋅* Unordered sub-list. 
1. Actual numbers don't matter, just that it's a number
⋅⋅1. Ordered sub-list
4. And another item.

⋅⋅⋅You can have properly indented paragraphs within list items. Notice the blank line above, and the leading spaces (at least one, but we'll use three here to also align the raw Markdown).

⋅⋅⋅To have a line break without a paragraph, you will need to use two trailing spaces.⋅⋅
⋅⋅⋅Note that this line is separate, but within the same paragraph.⋅⋅
⋅⋅⋅(This is contrary to the typical GFM line break behaviour, where trailing spaces are not required.)

* Unordered list can use asterisks
- Or minuses
+ Or pluses

[I'm an inline-style link](https://www.google.com)

[I'm an inline-style link with title](https://www.google.com "Google's Homepage")

[I'm a reference-style link][Arbitrary case-insensitive reference text]

[I'm a relative reference to a repository file](../blob/master/LICENSE)

[You can use numbers for reference-style link definitions][1]

Or leave it empty and use the [link text itself].

URLs and URLs in angle brackets will automatically get turned into links. 
http://www.example.com or <http://www.example.com> and sometimes 
example.com (but not on Github, for example).

Some text to show that the reference links can follow later.

[arbitrary case-insensitive reference text]: https://www.mozilla.org
[1]: http://slashdot.org
[link text itself]: http://www.reddit.com

Here's our logo (hover to see the title text):

Inline-style: 
![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")

Reference-style: 
![alt text][logo]

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 2"

Inline `code` has `back-ticks around` it.

```javascript
var s = "JavaScript syntax highlighting";
alert(s);
```
 
```python
s = "Python syntax highlighting"
print s
```
 
```
No language indicated, so no syntax highlighting. 
But let's throw in a <b>tag</b>.
```
Three or more...

---

Hyphens

***

Asterisks

___

Underscores

