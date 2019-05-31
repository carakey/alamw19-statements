# ALAMW19 Statements Metadata Model

## About

This custom metadata model defines an XML format for encoding texts, enabling their manipulation, analysis, and presentation in other formats through the application of XML tools including XSL and XQuery. It was conceived as part of a research project involving qualitative text analysis of anti-racist statements from professional library organizations.

At the present time, there is no formal encoded schema (XSD, DTD, etc.) documenting the model. Elements describing the document's structure borrow heavily from TEI - especially in the Header section, where most definitions are borrowed from the TEI documentation at https://www.tei-c.org/ (as indicated).

The model is designed to be reusable for other bodies of text. Elements and attributes are meant to be widely applicable. Controlled values for attributes, however, are specific to the text of the ALAMW19 Statements project.

## Elements

### F1 Markup Phase: Document Structure

Structural elements are the same as or similar to TEI elements as noted.      

| Element Name | TEI Mapping | Usage | Path |
|---|---|---|---|
| Document |  tei:TEI | Use as the root element of the XML document. | `/document` |
| HEADER SECTION |
| Header | tei:teiHeader | Supply descriptive and declarative metadata about the text and the project in subelements File Description and Encoding Description.| `/document/header` |
| File Description | tei:fileDesc | Supply bibliographic description of the electronic file in subelements Title Statement, Publication Statement, and Source Description. | `//header/fileDesc` |
| Title Statement | tei:titleStmt | Group information about the title of a work and those responsible for its content in subelements Title and Responsibility Statement. | `//header/fileDesc/titleStmt`|
| Document Title | tei:title | Record the title of the electronic file and/or the project. This is separate from the title of the source text. | `//header/fileDesc/titleStmt/ title` |
| Responsibility Statement | tei:respStmt | Record the responsibility for the creation of the electronic file and/or the project in Responsibility subelement. | `//header/fileDesc/titleStmt/ respStmt` |
| Responsibility | tei:resp | Record the responsibility for the creation of the electronic file and/or the project. This is separate from the creator of the source text. | `//header/fileDesc/titleStmt/ respStmt/resp` |
| Publication Statement | tei:publicationStmt | Record information about the publication of the electronic file. Enclose text using one or more `<p>` (Paragraph) subelements. | `//header/fileDesc/ publicationStmt` |
| Source Description | tei:sourceDesc | Record information about the source from which an electronic text was derived or generated. Enclose text using one or more `<p>` (Paragraph) subelements. | `//header/fileDesc/sourceDesc` |
| Encoding Description | tei:encodingDesc | Record information about the relationship between the electronic file and the source material in subelements Project Description and Sampling Declaration. | `//header/encodingDesc` |
| Project Description | tei:projectDesc | Record the aim or purpose for which an electronic file was encoded. Enclose text using one or more `<p>` (Paragraph) subelements. | `//header/encodingDesc/ projectDesc`|
| Sampling Declaration | tei:samplingDecl | Record information about the rationale and methods for sampling, e.g. including or exclude portions of text. Enclose text using one or more `<p>` (Paragraph) subelements. | `//header/encodingDesc/ samplingDecl/p`|
| TEXT SECTION |
| Text | Similar to tei:text, but with custom attributes | Contains a single text of any kind, whether unitary or composite. Under `<document>`, it separates the textual material contents from the header section. Under `<group>`, it separates each distinct source text into a unit. For distinct texts, use a @source attribute to record the URL of the source text in F1. [@focus](#text-focus-values) and [@context](#text-context-values) attributes are added to characterize the title of the text and stand in for the title in F2 and subsequent generations. The optional [@resp](#text-resp-values) attribute is used to indicate any applicable special characterization of the entity responsible for the text's creation. | `/document/text` or `/document/text/group/text`|
| Text Group | tei:group | Contains the body of a composite text, grouping together a sequence of distinct texts. | `/document/text/group`|
| Front | tei:front | Use for supporting text preceding the main body of a text. Include here any text before the main body that should not be considered for content analysis. Should include Document Title; may also include typed Text Division subelements as appropriate. The F1 to F2 transformation removes all content within the Front element. | `//text/front` |
| Body | tei:body | Contains the whole body of a single unitary text. Include the full portion of the source text that should be considered for content analysis. | `//text/body` |
| Back | tei:back | Use for any supporting text following the main body of a text. Include here any text after the main body that should not be considered for content analysis. Use typed Text Division subelements as appropriate. The F1 to F2 transformation removes all content within the Back element.| `//text/back` |
| Document Title | tei:docTitle | Encloses the text's given title.  The F1 to F2 transformation removes the given title, in order to anonymize and standardize data for analysis. Subsequent generations have no content in the `<docTitle>` element, but text attribute values characterizing the title are retained. | `//text/front/docTitle` |
| Text Division | tei:div | Contains a subdivision of text. Use within Front and Back elements to minimally define sections of supporting information around the body of the source text(s). Use multiple `<div>` elements to separate functional divisions of text. Select the division type using the [@type](#text-division-type-values) attribute. Enclose text using subelements Head, Line, or Paragraph. | `//text/front/div` or `//text/back/div` |
| Head | tei:head | Use to enclose text that is formatted as a heading. | `//div/head` or `//body/head` |
| Line | Similar to tei:l but not restricted to verse | Use to enclose a portion of text that is formatted as a line. | `//div/l` or `//body/l`|
| Paragraph | tei:p | Use to enclose a portion of text that is formatted as a paragraph. | `//div/p` or `//body/p` |
| Link | Similar to tei:link but with custom syntax | May appear within any element that contains text. Insert a _self-closing_ (i.e. empty) Link element _after_ the linked text. Use a @target attribute whose value is the linked URL. The F1 to F2 transformation removes the URL but inserts the string "[Link]" to denote that a link exists in the source text. | `//*/link` |

### Controlled Attribute Values for F1 Document Structure Elements

#### Text _@focus_ Values

| Attribute Value | Usage |
|---|---|
| racism | Use when the title of the text includes the word "racism." |
| discrimination | Use when the wording of the title of the text refers to specific negative behaviors, for example, "racist incidents" or "harassment". |
| incidents | Use when the statement title refers to "incident" or "incidents" but does not indicate their nature. |
| edi | Use when the title of the text includes one or more of "equity," "diversity," "inclusion." |
| unspecified | Use when the title of the text does not indicate the focus of the text. |

#### Text _@context_ Values

| Attribute Value | Usage |
|---|---|
| alamw19 | Use when the title of the text refers to the ALA Midwinter Meeting 2019, including specific meetings during that event (e.g. "Council Forum"). |
| profession | Use when the title of the text refers to "the library profession" or "the profession." |
| unspecified | Use when the title of the text does not indicate the context of the text. |

#### Text _@resp_ Values

| Attribute Value | Usage |
|---|---|
| ea | Use when the issuing organization is one of the self-described ethnic affiliates of the ALA. |

#### Text Division _@type_ Values

| Attribute Value | Usage |
|---|---|
| about | Use when the text division includes descriptive information about the organization responsible for the creation of the text. |
| contact | Use when the text division includes contact information. |
| pub_note | Use when the text division pertains to the circumstances of the text's publication, including authorship, date, production, etc. |
| tags | Use when the text division includes tags or keywords categorizing the text. |

- - - - -

### F1 Markup Phase: Entities

Entity tags are a custom element used to anonymize and standardize the text for more effective and less biased content analysis. The F1 to F2 transformation redacts the entity tags and their enclosed text, and replaces them in subsequent document generations with a generic stand-in text value, which is constructed from the assigned attribute values.  

| Property | Value |
|---|---|
| Element Name | Entity |
| Path | `//body/p/entity` |
| Definition | An entity is anything which has a distinct existence as an individual unit. |
| Usage | Surround named entities with an Entity tag. Inclusion or exclusion of designators like "the" and "our" is somewhat flexible, and best judgment may be used for readability of the output. Use the [@type](#entity-type-values) attribute to specify the type of entity. Use the [@identity](#entity-identity-values) attribute to specify whether and how the entity is identified in the text. |

#### Entity _@type_ Values

| Attribute Value | Usage |
|---|---|
| person | Use for a specific individual. |
| organization | Use for an organized official body or a collection of official bodies. Note: for this project, an organization's sub-units such as governing bodies and office names are not included within the Entity tag. |
| event | Use for an organized event at a fixed time and place, such as a conference or a meeting. |
| place | Use for a geographic location, such as a city or a named building. | | program | Use for an organized program, process, or similar effort that is recurring or ongoing, such as a training course, a scholarship fund, etc. |
| protected_group | Use to designate a group of people qualified for special protection. The primary purpose of the tag in the ALAMW19 project is to preserve the anonymity of publishing organizations which serve specific communities, which would be easily identifiable where the text names the protected group they serve. |
| functional_area | Use to designate a professional functional area in which an organization concentrates its activities. The primary purpose of the tag in the ALAMW19 project is to preserve the anonymity of publishing organizations working in specific functional areas, which would be easily identifiable where the text names their area of activity. |

#### Entity _@identity_ Values
| Attribute Value | Associated _@type_ Value(s) | Usage |
|---|---|---|
| self | Organization entities only | Use when the entity being referred to represents the organization responsible for producing the statement. |
| named | Person entities only | Use when the name of the person is given. |
| implied | Person entities only | Use when a specific person is being referred to without giving their name, but their identity could be derived from the identifying information given. (For example, a person referred to by their title when only one individual holds that title in the organization.) |
| anonymous | Person entities only | Use when a specific person is being referred to without giving their name, and their identity cannot be established using only the identifying information given. (For example, a person referred to by their title when multiple individuals hold that title in the same organization. Note that in a highly publicized incident, identity is likely be surmisable even for a person marked anonymous in the text.) |

### F4 Markup Phase: S-Units

The "S-Unit" or Sentence element is adapted from TEI's S-Unit element (tei:s), demarcating the expression of individual sentence-like units. Custom attributes characterizing the sentence are added to this element at a later stage of markup, used for analyzing the text.

| Property | Value |
|---|---|
| Element Name | S-Unit |
| Path | `//body/p/s` |
| Definition | Contains a sentence-like division of a text. |
| Usage | Surround sentence-like units of text with an S-Unit `<s>` tag. A "sentence-like unit" expresses a single idea, typically with a subject, verb, and object (sometimes implied/understood).  Multiple `<s>` elements may occur within an orthographic sentence in the text. Where editorial changes are needed to preserve meaning and maintain syntax, surround changes in square brackets. |

#### S-Unit Attributes (in progress)
| Attribute Name | Usage | Values |
|---|---|---|
| @type | Categorize the type of sentence using the controlled type list. | description / proposal |

| @actor |
| @action |
| @object |
| @voice | Indicate whether the sentence is written using active voice, passive voice, or is indefinite. |
| @tone | Indicate whether the tone sentence is positive (p), negative (n), or neutral/mixed/unclear (u) |
