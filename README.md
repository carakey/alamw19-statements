
# ALAMW19 Anti-Racist Statements: Text Encoding and Analysis

## About

This repository includes data and supporting documentation for a research project that endeavors to perform text encoding and qualitative text analysis of eighteen statements published by professional library organizations in response to the incidents of racism and harassment that occurred at the 2019 ALA Midwinter Meeting and Exhibits (ALAMW19).

The text is encoded using [a custom XML schema](documentation/metadata_model.md), which is included in this repository. The encoding was done through a combination of manual markup and iterative XSL transformations, as described below and throughout the repository. The resulting data supports qualitative content analysis using XQuery.

### Source Materials   

The original texts included in this project were published by ALA units and affiliate organizations, and those creators retain all rights to their content. The texts were originally posted on various platforms, including organization web sites, ALA Connect, and social media sites. The specific web location for each text statement is identified in the statement metadata in the first generation (F1) XML document, [alamw19_statements_f1.xml](xml_generations/alamw19_statements_f1.xml). A full bibliography is also provided; see [Bibliography of Source Texts](documentation/bib_source_texts.md).

Note that attribution for the materials is obscured in subsequent XML document generations as the data undergoes processing, in an effort to anonymize and thus more equitably analyze the text. __It is not my intent to portray the text as my own work__. Again, the creators hold copyright over their materials.

The statements list was drawn from the document ["Statements from ALA Units and Affiliates on Racism within ALA"](https://docs.google.com/document/d/13IQd6EZCN5Z670y5G-2bpkUMnqpOE9KeWv0YD2ig6os) by Diedre Conkling. The document was posted by Conkling on Feb 7, 2019 to a discussion board on [ALA Connect](https://connect.ala.org/communities/community-home/digestviewer/viewthread?MessageKey=44874995-10d0-4ecf-85e0-3eb701250303&CommunityKey=927d02c1-673b-4e91-9911-8fdf8dc3407f&tab=digestviewer#bm44874995-10d0-4ecf-85e0-3eb701250303) (link restricted to authorized users). Four of the twenty-two resources listed were not used in the project: one that was determined not to be a "statement" per se; one whose issuing organization was not from an ALA affiliate; and two which were no longer available at the given links as of May 2019.

### Naming Conventions

* The use of the shorthand F1, F2, etc. to denote versions of the text follows generation notation from Mendelian genetics.

    * This convention is meant to indicate an iterative transformation process that is separate from the "versioning" of individual XML files -- what might happen at subsequent saves in the course of manual markup, for example. The "generations" of the text data represent distinct stages in an encoding process.

    * (The 'P' generation would be the original texts at their various source locations.)

* The designation 'raw' in the filename indicates an XML document produced as direct output from an XSL transformation, without any manual edits.

### Software

This project relied heavily on Oxygen XML Editor for XML encoding as well as XSLT and XQuery scripting, debugging, and processing.

Markdown documents were written in Atom and tested with the Markdown Preview Plus package.

Python scripts were run with Python 2.7 using Mac OS Terminal.

## Text Encoding  

### First Generation (F1) Markup

The first phase of the project consisted of copying the source texts from their various web locations into the Oxygen editor, marking up the document structure, and composing the XML document header. The metadata model, which follows a selection of TEI elements fairly closely for the header and throughout the document structure, was developed and iterated upon throughout this phase. The model aims to be reusable in other projects. The metadata model is described in greater detail here: [ALAMW19 Statements Metadata Model](documentation/metadata_model.md).

Analysis and interpretation in the initial structural markup phase mainly occurred in two ways. The first was in making a distinction between the "essential" body of the text that would be further investigated and analyzed, versus "supporting" text that would not, such as information about the responsible organizations and about the circumstances of the texts' publication.

The second was in the assignment of categories to Document Titles, recorded in attributes. I observed that the statements' titles followed a small number of wording patterns pertaining to their stated focus and context.

For focus, 17 out of 18 used one of four concepts:

1. The word "racism," emphasizing the systemic concern
1. A reference to negative behaviors violating the Code of Conduct, such as "racist incidents" or "aggression"
1. A reference to "incident" or "incidents" without further characterization
1. One or more of "equity," "diversity," and "inclusion"

For context, 11 out of 18 titles explicitly addressed either:

1. The isolated event(s) of the 2019 ALA Midwinter Meeting[^1]
1. The library profession

[^1]: One statement title used the wording “ALA Conferences,” which somewhat sits in between the two categories. However, analyzing the title in conjunction with the text, the first sentence referred to incidents at “the most recent American Library Association Midwinter Meeting,” and so I did make a judgment call to mark it in the "ALAMW19" category.

After the initial pass encoding the structure, the next effort was about anonymizing the text. I encoded as _entities_ all specifically identified people, organizations, places, events, and named programs, as well as mentions of specific protected groups and functional areas that would identify the organization responsible for the text. For organizations, I also marked whether the reference was to the same organization responsible for the statement or to an affiliate. For people, I marked the level of anonymity: whether the person had been identified by name, could be identified by the information given, or was referred to anonymously (as much as possible given the publicity of the events).

### F1 to F2 Conversion: Anonymized (Redacted) Text

The project's objective isn't to call out a particular organization for problematic wording, nor to compare which specific organization produced a more or less effective statement. My intention with the first transformation was to reduce bias - mainly my own - in the analysis of the content. Standardizing the data and reducing the text down to its essential content was also meant to simplify later analysis.

Anonymity was increased drastically by redacting all tagged entities from F2 and subsequent generations of the document, replacing them with generic substitute text strings identifying the type of entity, e.g. "[Organization]." The added identity information was also incorporated into the substitute text strings. Additionally, supporting contextual information about the text was dropped, including document titles; only the standardized title categories were kept.  

A list of [all redacted ALAMW19 entities](documentation/entity_list.html) is included in the project documentation, generated using XQuery, [entity_list.xquery](queries/entity_list.xquery).

A list of [ALAMW19 Document Titles sorted by their attributes](documentation/title_att_list.html) is included in the project documentation, generated using XQuery, [title_att_list.xquery](queries/title_att_list.xquery).

#### Method

1. Created XSLT, [f1-f2_anonymize.xsl](xsl_transforms/f1-f2_anonymize.xsl), to copy the essential text from F1 and make the following changes:
    * Remove all _front_ and _back_ element sections (with supporting, contextual information) from each text, including the source URL identifying each text
    * Copy title attributes into _text_ element
    * Remove identifying entity names within text, constructing a substitute text string
    * Remove linked URLs from text, inserting a substitute text string

1. Applied this XSLT to transform [alamw19_statements_f1.xml](xml_generations/alamw19_statements_f1.xml) to [alamw19_statements_f2_raw.xml](xml_generations/alamw19_statements_f2_raw.xml).

### F2 to F3 and F3 to F4 Conversion: Random-Ordered Text

In spending the time marking the entities, I developed a loose sense of the location of each organization's statement within the document, which could still lead to the same bias problem in my analysis. To address this, I copied the statements to an F3 document in a randomized order. To further obscure the original order, I then repeated the process to produce an F4 document.

#### Method

1. Ran Python [random.shuffle](https://docs.python.org/3/library/random.html#random.shuffle) function to create a randomized list of integers from 1-18:
    ```
    from random import shuffle
    x = [[i] for i in range(1,19)]
    shuffle(x)
    print(x)
    ```
    * Note: Python counts starting with 0, while XSL counts starting with 1 - thus the (1,19) range.

1. Received output: `[[14], [1], [16], [18], [17], [3], [10], [5], [13], [12], [9], [15], [4], [6], [8], [2], [11], [7]]`

1. Incorporated this output into XSLT, [f2-f3_randomize.xsl](xsl_transforms/f2-f3_randomize.xsl), using the list as the index position for copying each <statement> element.

1. Applied XSLT to transform [alamw19_statements_f2_raw.xml](xml_generations/alamw19_statements_f2_raw.xml) to [alamw19_statements_f3_raw.xml](xml_generations/alamw19_statements_f3_raw.xml).

1. Repeated the process above, running Python random.shuffle again to create a new list of integers.

1. Received output: `[[10], [18], [7], [2], [13], [1], [4], [12], [15], [8], [5], [9], [6], [16], [11], [14], [17], [3]]`

1. Incorporated this output into an almost identical XSLT, [f3-f4_randomize.xsl](xsl_transforms/f3-f4_randomize.xsl), replacing the index positions.

1. Applied XSLT to transform [alamw19_statements_f3_raw.xml](xml_generations/alamw19_statements_f3_raw.xml) to [alamw19_statements_f4_raw.xml](xml_generations/alamw19_statements_f4_raw.xml).
