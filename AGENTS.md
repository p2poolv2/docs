# Agent Guidelines

## Writing style

All prose written for this site follows William Strunk Jr.'s *The
Elements of Style* (1918). The rules apply to page text, diagram
labels and captions, commit messages, and review comments. Check every
draft against them before handing it over.

### Elementary rules of usage

1. Form the possessive singular of nouns by adding 's, whatever the
   final consonant: "Charles's friend", "the pool's wallet".
2. In a series of three or more terms with a single conjunction, put a
   comma after each term except the last: "miners, pools, and
   regulators".
3. Enclose parenthetic expressions between commas: "The pool, however,
   still controls payouts."
4. Place a comma before a conjunction that introduces a co-ordinate
   clause: "The miner builds the template, but the pool decides the
   payout."
5. Do not join independent clauses with a comma. Use a semicolon, a
   conjunction, or two sentences.
6. Do not break sentences in two. A fragment such as "Unlike SV2." is
   not a sentence.
7. A participial phrase at the beginning of a sentence must refer to
   the grammatical subject. Write "Running its own node, the miner
   selects transactions", not "Running its own node, transactions are
   selected by the miner".

### Elementary principles of composition

8. Make the paragraph the unit of composition: one paragraph to each
   topic.
9. As a rule, begin each paragraph with a topic sentence and end it in
   keeping with the beginning.
10. Use the active voice. "The pool rejects the share", not "The share
    is rejected by the pool".
11. Put statements in positive form. Say what is, not what is not:
    "The pool withholds payment", not "The pool does not make payment".
12. Omit needless words. Every word must do work. Cut phrases such as
    "the fact that", "in order to", "it is important to note that",
    "there is no doubt but that", and "the question as to whether".
13. Avoid a succession of loose sentences, that is, strings of clauses
    joined by "and", "but", "which" or "so". Vary the structure.
14. Express co-ordinate ideas in similar form. Items in a list, and
    parallel sentences, share one grammatical shape.
15. Keep related words together. Place modifiers next to the words
    they modify, and keep the subject near its verb.
16. In summaries, keep to one tense.
17. Place the emphatic words of a sentence at the end.

### Matters of form

- Headings: keep them short, in a consistent case, with no final
  period.
- Quotations: introduce formal quotations with a colon and quotation
  marks; set long quotations as a block without quotation marks.
- References: give exact references (page, section, spec version) in
  a consistent form, in parentheses or a footnote rather than
  interrupting the sentence.
- Titles of works: italicise them.
- Numerals: spell out numbers under ten in prose, except dates,
  measurements, and technical values (3s, 51%, 2 of 3).
- Parentheses: punctuate the sentence as if the parenthetical were
  absent.

### Words and expressions commonly misused

- **All right**: two words.
- **As good or better than**: write "as good as, or better than".
- **As to whether**: "whether" is enough.
- **Case**: often needless. "In many cases, pools…" becomes "Many
  pools…".
- **Certainly**, **very**, **so** (as intensifiers): cut them.
- **Character**, **nature**, **system**: often needless. "Acts of a
  hostile character" becomes "hostile acts".
- **Claim**: not a synonym for "declare" or "maintain".
- **Compare to / compare with**: "to" for likeness between things of
  different order, "with" for differences between things of the same
  order. This page compares P2Poolv2 *with* SV2 and DATUM.
- **Different than**: write "different from".
- **Due to**: not a synonym for "because of"; it follows a form of
  "to be": "The delay was due to congestion."
- **Etc.**: avoid; never after "such as" or "for example".
- **Fact**: use only for matters that can be verified, not for
  judgements.
- **Factor**, **feature**, **phase**: hackneyed; name the thing
  itself.
- **Fix**: not a synonym for "arrange" or "prepare" in formal prose.
  "Fix a bug" is fine.
- **However**: when it means "nevertheless", it does not come first in
  its sentence or clause. Write "The pool, however, controls payouts."
- **Interesting**: show why the thing is interesting instead.
- **Kind of**, **sort of**: not for "rather" or "something like".
- **Less**: for quantity; use **fewer** for number. "Fewer shares",
  "less hashrate".
- **Line**, **along these lines**: overworked; drop them.
- **Literal, literally**: do not use for emphasis.
- **Most**: not for "almost".
- **One of the most**: avoid as an opening formula.
- **People**: not for "the public" in general; name the group.
- **Possess**: prefer "have" or "own".
- **Prove**: use only for things that are demonstrated.
- **Respective, respectively**: usually needless.
- **State**: not a synonym for "say" or "remark".
- **Viewpoint**: prefer "point of view" or name the stance.
- **While**: use for time, not for "and", "but" or "although".
- **Worth while**: overworked as a term of vague approval.
- **Would**: not for habitual action in plain narrative.

### Project adaptations

These points override Strunk where the 1918 text conflicts with this
site's conventions or with modern technical writing.

- **They**: use singular "they" for a person of unstated gender.
  Strunk's rule against it does not apply.
- **Data**: may be used as a mass noun ("the data is").
- **Spelling**: use American spelling (-ize, -or): "centralized",
  "decentralized", "behavior".
- **Serial comma** (rule 2): applies to prose. Diagram labels and
  captions may drop it when space is tight.
- **Hyphenation at line ends**: Strunk's rule on dividing words does
  not apply; AsciiDoc source is not hyphenated by hand.
- **Technical terms**: keep the names protocols and projects give
  themselves (DATUM Gateway, Job Declaration, OCEAN, P2Poolv2), even
  when a rule above would prefer a plainer word.
- **Passive voice** (rule 10): allowed when the actor is unknown or
  beside the point and the object is the topic: "Generated images are
  written to `/diagrams/`." Prefer the active voice everywhere else.
- **Fragments** (rule 6): allowed in list items, table cells,
  definition-list entries, callouts, captions, headings, and diagram
  labels. Full sentences are required in paragraphs.
- **Instructions**: address the reader as "you" and use the imperative
  mood for steps: "Run the internal check before pushing."
- **Headings**: use Title Case for page titles and section headings.
  Capitalize every word except articles, coordinating conjunctions,
  and prepositions of three letters or fewer ("a", "and", "for", "on",
  "to"), which stay lowercase unless they come first. Verbs and
  pronouns are capitalized however short: "Testnet4 Is Live", "Working
  on It". Block titles and captions are not headings and stay in
  sentence case.
- **Sharechain**: write "sharechain" as one word, never "share chain"
  or "share-chain".
- **Names in prose**: write "P2Poolv2" (not "p2poolv2" or "P2poolv2")
  and "Stratum" for the protocol, except in URLs, code, file names, and
  commands.
