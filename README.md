# Geoscience Language Models

## Update

A fork to consider minor corrections and updating for future use, including:-
### Portuguese
#### spacy
- https://spacy.io/models/pt
    - https://spacy.io/models/pt#pt_core_news_sm
    - https://spacy.io/models/pt#pt_core_news_lg
#### enchant
- https://stackoverflow.com/questions/69930781/python-pyenchant-portuguese-dictionary-install   
- makefiles
    - https://cgit.freedesktop.org/libreoffice/dictionaries/tree/Dictionary_pt-BR.mk
    - https://cgit.freedesktop.org/libreoffice/dictionaries/tree/Dictionary_pt-PT.mk
- dictionaries
    - https://cgit.freedesktop.org/libreoffice/dictionaries/tree/pt_BR
    - https://cgit.freedesktop.org/libreoffice/dictionaries/tree/pt_PT
    - https://cgit.freedesktop.org/libreoffice/dictionaries/tree/es
    - https://cgit.freedesktop.org/libreoffice/dictionaries/tree/sv_SE

### Spanish
- https://spacy.io/models/es
    - https://spacy.io/models/es#es_core_news_sm
    - https://spacy.io/models/es#es_core_news_md
### Swedish
- https://spacy.io/models/sv
    - https://spacy.io/models/sv#sv_core_news_sm
    - https://spacy.io/models/sv#sv_core_news_lg
### Finnish
- https://spacy.io/models/fi
    - https://spacy.io/models/fi#fi_core_news_sm
    - https://spacy.io/models/fi#fi_core_news_lg

- Perhaps add _multi versions of all nrcan libary that will take a language flag?
- investigate models

### Windows
- try running some things on a windows machine and see how it goes for tests
- list requirements for windows 10 trial
- requirements
    - have used these elsewhere, doesn't mean this grouping will work on windows
      - pdfminer=20191125
      - pandas=1.1.3
      - python=3.8
      - tqdm=4.49
      - filelock=3.0.12
      - unidecode=1.1.2
      - spacy=2.3.5
      - langdetect=1.0.8
      - pyyaml=5.3.1
      - pyenchant==3.2.0
      - particular spacy language models
        - python3 -m spacy download en_core_web_smd
        - python3 -m spacy download en_core_web_lg

- gloVe
    - training a large model on windows far from ideal: default C version is definitely much nicer
    - getting a python version of gloVe working is also not trivial, generally
    
### Docker
- containerise a multi language version
    - see spacy install etc.
    - want is available with default ubuntu install for enchant re: languages
        - if not enough, need to add downloading and moving manually
    
### enchant gotchas
- https://pyenchant.github.io/pyenchant/install.html
    - The only provider is hunspell
    - pip install pyenchant
    - download the hunspell dictionary files you need (both the .dic and .aff extensions) and put them inside /path/to/enchant/data/mingw<bits>/enchant/share/hunspell. 
    - You can find many dictionaries in LibreOffice sources.    
        - https://cgit.freedesktop.org/libreoffice/dictionaries/tree/
   
    
To update, will need to change:

### Preprocessing/cleaning
- check for language handling libraries
- and parameters in filters

#### prepocessing_str
- spacy.lang.en.stop_words
    - rm_stopwords_spacy
- SPACY_MODEL_SM = spacy.load('en_core_web_sm')
    - sentence_tokenize_spacy_sm
    - tokenize_spacy_sm
- SPACY_MODEL_LG = spacy.load('en_core_web_lg')
    - sentence_tokenize_spacy_lg
    - tokenize_spacy_lg
    
#### prepocessing_dfcol
- uses enchant
    - EN_DICT = enchant.Dict("en_CA")
        - rm_stopwords_spacy # local english import
            - from spacy.lang.en.stop_words import STOP_WORDS

#### prepocessing_dffilter
- uses enchant
    - EN_DICT = enchant.Dict("en_CA")
- filter_non_english
    - hardcored language filter
        - if do_filter:
            return dff[dff.lang == "en"] 
- so need to check filter codes for various languages

### Pipelines
- add new versions



## Original Readme

## Introduction
Language models are the foundation for the predictive text tools that billions of people in their everyday lives. Although most of these language models are trained on vast digital corpora, they are often missing the specialized vocabulary and underlying concepts that are important to specific scientific sub-domains. Herein we report two new language models that were re-trained using geoscientific text to address that knoweldge gap. The raw and processed text from the GEOSCAN publications database, which were used to generate these new language models are reported in a pending Open File. Language model performance and validation are discussed separately in a pending manuscript. The supporting datasets and preferred language models can be used and expanded on in the future to support a range of down-stream natural language processing tasks (e.g., keyword prediction, document similarity, and recommender systems).


## Geoscience language modelling methods and evaluation
Christopher J.M. Lawley, Stefania Raimondo, Tianyi Chen, Lindsay Brin, Anton Zakharov, Daniel Kur, Jenny Hui, Glen Newton, Sari L. Burgoyne, Geneviève Marquis, 2022, Geoscience language models and their intrinsic evaluation, Applied Computing and Geosciences, Volume 14, https://doi.org/10.1016/j.acags.2022.100084


## Geoscience language models and corpus
Raimondo, S., Chen, T., Zakharov, A., Brin, L., Kur, D., Hui, J., Burgoyne, S., Newton, G., Lawley, C.J.M., 2022, Datasets to support geoscience language models, Geological Survey of Canada, Open File 8848, 5 pages, https://doi.org/10.4095/329265


## Text data
Language models are based, in part, on a variety of geoscientific publications sourced from the Natural Resources Canada (NRCan) GEOSCAN publications database (n = 27,081 documents). Figures, maps, tables, references, irregularly formatted text, and other large sections of documents from poor quality scans were excluded from further analysis (i.e., the total GEOSCAN database contains approximately 83k documents; however <32% were readily available for use as part of the current study). The “pdfminer” library was used to extract text from the remaining pdf documents prior to a number of pre processing steps, including removing punctuation, replacing upper casing, removing French text, removing specific forms of alpha-numeric data (e.g., DOIs, URLs, emails, and phone numbers), converting all non-ascii characters to their ascii equivalent, filtering text boxes that contain an insufficient percentage of detectable words, and merging all of the extracted text for each document. Raw and pre-processed text data from the GEOSCAN publications database will be made avialable in a pending Open File. Additional geoscientific publications that were used to re-train language models were sourced from provincial government publication databases (e.g., Ontario Geological Survey, Alberta Geological Survey, and British Columbia Geological Survey; n = 13,898 documents) and a subset of open access journals (e.g., Materials, Solid Earth, Geosciences, Geochemical Perspective Letters, and Quaternary) available through the Directory of Open Access Journals (DOAJ; n = 3,998 documents).



## GloVe Model
The Global Vectors for Word Representation (GloVe) method (Pennington et al., 2014) was used to map each word in the training corpus to a set of numerical vectors in N-dimensional space and was originally trained using billions of words, or sub-words, from the Wikipedia (2014) and the 5th Edition of English Gigaword (Parker et al., 2011). This original GloVe model was then re-trained as part of the current study using the smaller, but domain specific corpora to improve model performance (i.e., the preferred GloVe model). This preferred GloVe model was trained using the AdaGrad algorithm with the most abundant tokens (i.e., minimum frequency of 5), considering a context window of size 15 for 15 iterations, fixed weighing functions (x_max = 10 and alpha = 0.75) and is based on the 300 dimensional vectors as described by Pennington et al. (2014).


## BERT Model
Contextual language models, including the Bidirectional Encoder Representations from Transformers (BERT) method (Devlin et al., 2019), consider words and their neighbours for a more complete representation of their meaning. The original BERT model was pre trained on the Books Corpus (Zhu et al., 2015) and English Wikipedia, comprising billions of words. More recently, the DistilBERT method (Sanh et al., 2019) was proposed to simplify the training process for smaller datasets, produce language models that are less susceptible to overfitting, and yield model performance that are comparable to the original BERT method. The first step for all BERT models is to convert pre processed text to tokens, which may include words, sub-words or punctuation. Sub-word tokenization limits the number of out-of-vocabulary words, which allows BERT models trained on general corpora to be applied to specific sub-domains. A geology specific tokenizer was created as part of the current study by adding geology tokens prior to continued pre-training using the geological corpora. This preferred BERT (i.e., using the geo-tokenizer and geological corpora) model was generated using the “HuggingFace” machine learning library with the same combination of hyper-parameters described in the original Devlin et al. (2019) method (e.g., learning rate =  5e-5 and 2.5e-5; batch size = 48; max steps = 1 and 3 million; warm-up steps: 0, 100k, 300k).



## Example Application
Principal component analysis (PCA) biplot of mineral names colour coded to the Dana classification scheme. Word vectors for matching mineral names (n = 1893) are based on the preferred GloVE model. Minerals with similar classifications plot together in PCA space, reflecting similar vector properties. Word embeddings provide a powerful framework for evaluating and predicting mineral assemblages based on thousands of observations from the natural rock record.



![Figure](https://github.com/NRCan/Geological_Language_Models/blob/a8e3a23ae3e6f529dbb4bcc4fab1774ddaa530e4/Figure01.jpg)



## References

Devlin, J., Chang, M.-W., Lee, K., and Toutanova, K., 2019, Bert: Pre-training of deep bidirectional transformers for language understanding: arXiv, v. arXiv:1810, p. 16.

Parker, R., Graff, D., Kong, J., Chen, K., and Maeda, K., 2011, English Gigaword Fifth Edition: English Gigaword Fifth Edition LDC2011T07.

Pennington, J., Socher, R., and Manning, C., 2014, GloVe: Global vectors for word representation: Proceedings of the 2014 Conference on Empirical Methods in Natural Language Processing (EMNLP), p. 1532–1543.

Sanh, V., Debut, L., Chaumond, J., and Wolf, T., 2019, DistilBERT, a distilled version of BERT: smaller, faster, cheaper and lighter: arXiv, v. arXiv:1910, p. 5.

Zhu, Y., Kiros, R., Zemel, R., Salakhutdinov, R., Urtasun, R., Torralba, A., and Fidler, S., 2015, Aligning books and movies: Towards story-like visual explanations by watching movies and reading books: arXiv, v. arXiv:1506, p. 23.
