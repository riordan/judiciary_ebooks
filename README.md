# judiciary_ebooks

Created at NYPL/Readium Open Book Hack Day

# Tasks
- [x] Scrape Supreme Court opinions from HTML format from site
- [x] Add basic metadata: docket number
- [x] Add title.txt, metadata.xml
- [x] Convert from HTML to ePUB
- [x] Get more metadata: case title
- [ ] Get more metadata: case decision date
- [x] Add generic cover image

# Download and Read
- Click `epub` folder
- Click on any folder
- Click `View Raw` to download as `.epub`
- Open in an e-book reader like Readium (http://readium.org/)

# Run
- Install `pandoc`
- Run `rake ebook:scrape`

# Tools
- Pandoc: http://johnmacfarlane.net/pandoc/README.html
- Readium: http://readium.org/

# Source
- Cornell Law School Legal Information Institute (LII): http://www.law.cornell.edu/supremecourt/text/home