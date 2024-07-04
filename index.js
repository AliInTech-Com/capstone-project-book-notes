import express from "express";
import bodyParser from "body-parser";
import pg from "pg";

const app = express();
const port = 3000;
/**
 * Database connection
 */
const db = new pg.Client({
  user: "postgres",
  host: "localhost",
  database: "book-review",
  password: "12345",
  port: 5432,
});
db.connect();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));
/* redirect to root with notes list */
app.get("/", async (req, res) => {
  try {
    const result = await db.query("SELECT * FROM notes");
    let notes = result.rows;

    res.render("index.ejs", {
      bookNotes: notes,
    });
  } catch (err) {
    console.log(err);
  }
});
// sort list by recent read
app.get("/recentread", async (req, res) => {
  try {
    const result = await db.query("SELECT * FROM notes ORDER BY read_date DESC");
    let notes = result.rows;

    res.render("index.ejs", {
      bookNotes: notes,
    });
  } catch (err) {
    console.log(err);
  }
});
// sort list by rating
app.get("/ratings", async (req, res) => {
  try {
    const result = await db.query("SELECT * FROM notes ORDER BY rating DESC");
    let notes = result.rows;

    res.render("index.ejs", {
      bookNotes: notes,
    });
  } catch (err) {
    console.log(err);
  }
});
/* view book notes by id*/
app.get("/view/:id", async (req, res) => {
  try {
    let notesId = req.params["id"];
    const result = await db.query("SELECT * FROM notes WHERE id = $1", [
      parseInt(notesId),
    ]);
    let notes = result.rows;
    console.log(notes);
    res.render("view_book.ejs", {
      notesRow: notes,
    });
  } catch (err) {
    console.log(err);
  }
});
//add book notes
app.get("/add", async (req, res) => {
  try {
    res.render("add_book.ejs");
  } catch (err) {
    console.log(err);
  }
});
app.post("/add-notes", async (req, res) => {
  const bookTitle = req.body.booktitle;
  const bookIsbn = req.body.bookisbn;
  const bookReadDate = req.body.bookreaddate;
  const bookNotes = req.body.booknotes;
  const bookRating = req.body.bookrating;
 
  console.log(bookTitle + bookIsbn + bookReadDate + bookNotes);
  try {
    await db.query(
      "INSERT INTO notes (book_name, isbn_no, read_date, book_review,rating) VALUES ($1, $2, $3, $4, $5)",
      [bookTitle, bookIsbn, bookReadDate, bookNotes, bookRating]
    );
    res.redirect("/");
  } catch (err) {
    console.log(err);
    res.status(500).send("An error occurred while adding the note.");
  }
});
//edit book notes by id
app.post("/edit-notes/:id", async (req, res) => {
  let notesId = req.params["id"];
  const bookTitle = req.body.booktitle;
  const bookIsbn = req.body.bookisbn;
  const bookReadDate = req.body.bookreaddate;
  const bookNotes = req.body.booknotes;
  const bookRating = req.body.bookrating;
  console.log(bookTitle + bookIsbn + bookReadDate + bookNotes);
  try {
    await db.query(
      "UPDATE notes SET book_name = $1, isbn_no = $2 , read_date = $3 , book_review = $4 , rating = $5 WHERE id = $6",
      [
        bookTitle,
        bookIsbn,
        bookReadDate,
        bookNotes,
        bookRating,
        parseInt(notesId),
      ]
    );
    res.redirect("/");
  } catch (err) {
    console.log(err);
    res.status(500).send("An error occurred while adding the note.");
  }
});
app.get("/edit/:id", async (req, res) => {
  try {
    let notesId = req.params["id"];
    const result = await db.query("SELECT * FROM notes WHERE id = $1", [
      parseInt(notesId),
    ]);
    let notes = result.rows;
    console.log(notes);
    res.render("edit_book.ejs", {
      notesRow: notes,
    });
  } catch (err) {
    console.log(err);
  }
});

//delete book notes by id
app.get("/delete/:id", async (req, res) => {
  let id = req.params["id"];

  try {
    await db.query("DELETE FROM notes WHERE id = $1", [id]);
    res.redirect("/");
  } catch (err) {
    console.log(err);
  }
});
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
