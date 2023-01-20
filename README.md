# My Instagram

# 🎯 Objective

---

- Learn how to make a web application with ReactJS
- Make a backend in Express
- Use MySql
- Make a chat using [Socket.io](http://Socket.io)

# 📝 Part 1 - About ReactJS

---

## Who uses ReactJS

Some notable companies use react such as Facebook, Skype, Shopify, Discord, Instagram, Uber, Netflix, Tesla, Walmart and Airbnb

## Installation

*Ubuntu*

```bash
sudo apt-get install nodejs
```

```bash
sudo apt install npm
```

*Mac*

```bash
brew install nodejs
```

```bash
brew install npm
```

## Verify your installation

```bash
node -v
```

```bash
npm -v
```

## Start project

```bash
mkdir my-instagram; cd my-instagram
```

```bash
npx create-react-app clientInsta
```

```bash
mkdir serverInsta ; mkdir serverChat
```

```bash
rm -rf clientInsta/src/*
```

### You should have the following architecture

- my-instagram
    - clientInsta
    - serverInsta
    - serverChat

# 📝 Part 2 - Create the front of the application

---

## Import usefull dependencies

📂 /clientInsta/

```bash
npm install react-router-dom react-dom/client
```

## Run our first web page

📂 /clientInsta/src/index.js

- Create a file named **********index.js********** in the following directory **clientInsta/src/**

```jsx
import React from 'react';
import ReactDOM from 'react-dom/client';

function App() {
    return (
        <div>
            <h1>Hello world</h1>
        </div>
    );
}

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
    <App />
);
```

- Run the following command in your terminal, BE SURE TO BE in the **clientInsta** directory

```bash
npm run start
```

🎯 You should have a web page running with ******************Hello world****************** displayed

📌 **Remember**

- React uses components which are then added to an HTML file, for exemple the ********App******** tag contains the following tags which are then added the the ********************index.html******************** file in the **************public/************** folder

```jsx
<div>
    <h1>Hello world</h1>
 </div>
```

- A function can only return **one tag**

```jsx
function test() {
		return (
				<div>
						<h1>Header</h1>
						<div>
								<a>hello</a>
						</div>
						<div>
								<img src="img.png"/>
								<input/>
						</div>
						<p>footer</p>
				<div/>
		);
}
```

📚 **More resources**

- [https://fr.reactjs.org/docs/introducing-jsx.html](https://fr.reactjs.org/docs/introducing-jsx.html)

## Create the instagram feed

📂 /clientInsta/src/index.js

- As we saw earlier, React works with **component** **that we add together** to create a feature
- So, instead of coding everything in one function, we will cut features down
- Create a directory **component** which will contain every component of our web app
    - Feed insta (**Feed.js**)
    - Post insta (**Post.js**)
    - Header (**HomeHeader.js**)
- Let’s make our instagram feed on the home page with two components: the **header** and the **posts**
- Add the bold part to your file

```jsx
import React from 'react';
import ReactDOM from 'react-dom/client';
**import HomeHeader from './component/HomeHeader';
import Feed from './component/Feed';**

**function Home() {
    return (
        <div>
            <HomeHeader />
            <Feed />
        </div>
    );
}**

function App() {
    return (
        <div>
            <Home/>
        </div>
    );
}

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
    <App />
);
```

> Next Steps
> 
1. **Display static images** (logo insta, logo add post, logo send messages in the assets directory on [my github](https://github.com/my-activities/my-instagram))
2. **Change page** **to add posts to the feed**
3. **Make a form** with the name, description and image to add a post to the feed
4. **Create an elastic feed**

### Display **static images**

📂 /clientInsta/src/component/HomeHeader.js

- Import the logos (logo.png, post.png, send.png)
- Create a HomeHeader ****function which return the logos ([see above](https://www.notion.so/My-Instagram-7b3fea63f0e2445ea04560719b15ad62))
- export HomeHeader so index.js can import it ([see this link](https://beta.reactjs.org/learn/importing-and-exporting-components))

### Change page

📂 /clientInsta/src/component/HomeHeader.js

- Make it so, when I click on **post.png** I get on another page ([see link](https://www.geeksforgeeks.org/link-and-navlink-components-in-react-router-dom/))

## Make a form and your first dynamic page

📂 /clientInsta/src/index.js

- Import the logo logo.png
- When I click on the logo I get back to the home page
- Create 3 inputs differents
    - One for the name of the post
    - One for the description of the post
    - One for the image
- Add a button submit so that when the form is filled we can submit it
- For the moment when we submit, we print the content of the inputs on the console ([see link](https://reactjs.org/docs/hooks-state.html))

## Create an elastic feed

📂 /clientInsta/src/component/Feed.js

📂 /clientInsta/src/component/Post.js

- Create a function named Feed and create a function named Post
- Look at this [example](https://reactjs.org/docs/components-and-props.html#composing-components), and make Post return the following tags

```jsx
<div>
      <h1>{props.title}</h1>
      <p>{props.comment}</p>
</div>
```

📌 **Remember**

- We use props in React **to pass data from one component to another**
 (from a parent component to a child component(s)). Props is just a shorter way of saying properties. They are useful when you want the flow of data in your app to be dynamic

📚 **More resources**

- [https://www.w3schools.com/react/react_props.asp](https://www.w3schools.com/react/react_props.asp)

# 📝 Part 3 - Create the backend and use it in the front

---

## Import usefull dependencies

📂 /serverInsta/

```bash
npm init
```

```bash
npm install body-parser cors express dotenv mysql multer nodemon
```

## Create DB and create your .env file

📂 Anywhere

- Get Instagram.sql from [my github](https://github.com/my-activities/my-instagram)

```bash
mysql -u root -p < Instagram.sql
```

Call me if there is an issue

📂 /serverInsta/.env

```bash
DB_HOST=127.0.0.1
DB_USER=root
DB_PASS={{yourPassword}}
DB_NAME=myInstagram
```

## Initialize your server and make it run

📂 /serverInsta/index.js

- Import dependencies
- Init the server

```jsx
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json());
app.use(cors());

app.listen(3001, () => {
    console.log('Server is running on port 3001');
});
```

- Run the server

```bash
npm run dev
```

## Connect your DB and your server

📂 /serverInsta/db/connect.js

- connect DB to the server

```jsx
var mysql = require('mysql');
require('dotenv').config()

const my_db = () => {
    const db = mysql.createPool({
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASS,
        database: process.env.DB_NAME
      });
    return (db);
}

module.exports = { my_db };
```

📂 /serverInsta/index.js

- Add the bold part

```jsx
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const app = express();

**const db_func = require('./db/connect');
const db = db_func.my_db();**

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json());
app.use(cors());

app.listen(3001, () => {
    console.log('Server is running on port 3001');
});
```

## Initialize multer in the server

📂 /serverInsta/index.js

- Multer is a node.js middleware for handling multipart/form-data, which is primarily used for uploading files
- Add the bold part

```jsx
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const app = express();

const db_func = require('./db/connect');
const db = db_func.my_db();

**const multer = require('multer');
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, './uploads');
    },
    filename: (req, file, cb) => {
        cb(null, Date.now() + file.originalname);
    }
});
const upload = multer({storage: storage});**

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json());
app.use(cors());

app.listen(3001, () => {
    console.log('Server is running on port 3001');
});
```

## Make the CRUD (CREATE, READ, UPDATE and DELETE)

📂 /serverInsta/index.js

- We will start with the GET and POST method, and we’ll add PUT and DELETE later
- Add a GET method which **returns all the informations** from the IMAGES table in mysql ([see link for the GET method](https://expressjs.com/fr/guide/routing.html), [see link for mySQL cheatsheet](https://devhints.io/mysql))
- Add a POST method which **get the name, the description and the image link** and insert them to the IMAGES table in mysql ([see link for the POST method](https://codeforgeek.com/handle-get-post-request-express-4/), [see link for mySQL cheatsheet](https://devhints.io/mysql),  [see link to import the file with multer](https://expressjs.com/en/resources/middleware/multer.html))

## Let use our back in our app

📂 /clientInsta/component/Feed.js

- Let’s make an API call to get all the data from the IMAGES table to display them
- We will store the data the folllowing way

```jsx
const [postsInsta, setPostsInsta] = useState([]);
```

- Use fetch and useEffect ([see fetch and useEffect](https://jasonwatmore.com/post/2020/01/27/react-fetch-http-get-request-examples)) to make the API call
- Use *`posts.map()`* to display the data ([see link](https://www.notion.so/Note-workshop-def25e96c9b540d2a1de67d06ad6d06d))
    - *Don’t forget what we did before with the props*
    - *Look in which directory the images are stored*

📂 /clientInsta/index.js

- Get the data from our input in useStates ([see link](https://upmostly.com/tutorials/react-onchange-events-with-examples))
- *For the file input, verify what you have to send to the back, maybe print in the console the content of the target*
- When we click on the submit button `console.log` the data from our inputs
- Now, let’s make an API call to add data to the table IMAGES when submit is clicked
- Use fetch again to send the data ([see link](https://jasonwatmore.com/post/2020/02/01/react-fetch-http-post-request-examples)), the body must contain the following data

```json
[
	{
		YOUR_NAMED_IMAGE_LINK_IN_YOUR_BACK: YOUR_NAMED_IMAGE_LINK,
		YOUR_NAMED_IMAGE_NAME_IN_YOUR_BACK: YOUR_NAMED_IMAGE_NAME,
		YOUR_NAMED_IMAGE_DESCRIPTION_IN_YOUR_BACK: YOUR_NAMED_IMAGE_DESCRIPTION
	}
]
```

🎯 Now your front should be able to communicate with your back. When you add an image, you should see it on your feed (if not call me). You can even do some error handling (*check if the inputs are not empty)*

# 📝 Part 4 - Create a live chat in our app

---

## Import usefull dependencies

📂 /clientInsta/

```bash
npm install socket.io-client
```

## Create a new web page for the chat

📂 /clientInsta/ChatPage.js

- Create a new function named `ChatPage()`  which returns

 `<div> We are in the chat page </div>` and **import it to /clientInsta/index.js**

- When we click on **send.png** call the function ChatPage which change the window (if you forgot how to do it, [see link](https://www.notion.so/My-Instagram-7b3fea63f0e2445ea04560719b15ad62))
- Add **logo.png** to ChatPage and when we click on it we get back to the home page

## Install dependencies

📂 /serverChat/

```bash
npm init
```

```bash
npm install express nodemon socket.io
```

## Create the server for the chat

📂 /serverChat/index.js

- Initialize our express server like the following [link](https://socket.io/docs/v4/server-initialization/#with-express) (*change the port to an unused one*)
    - Add `console.log(`User Connected: ${socket.id}`);`  to see when a user is connected
    - Add `console.log(`User disconnected: ${socket.id}`);` when a user is disconnected
- Add **cors** option with the **origin** and the **method (POST and GET)** accepted ([see link](https://socket.io/docs/v4/server-options/#cors))

## Connect the front with the chat server

📂 /clientInsta/ChatPage.js

- Import Socket.io (*change the port to what you set*)

```jsx
import io from "socket.io-client";

const socket = io("http://localhost:3002");
```

- Add two text input and one button
    - One for the username
    - One for the room ID
    - Button submit to join the asked room
- When the button is clicked change a useState value
- Use a ternary to display a chat input (to send message later on)
- *Example of ternary*

```jsx
return (
	<div>
		{ Value ? (<p>True</p>) : (<p>False</p>) }
	</div>
);
```

## Join a Room

📂 /serverChat/index.js

- Join a room ([see link](https://socket.io/docs/v3/rooms/#joining-and-leaving))
- Example of communication Socket.io

```jsx
[client]
const socket = io("http://localhost:3002");
socket.emit("join_room", roomID);
/...

[server]
io.on("connection", (socket) => {
		socket.on("join_room", (data) => {
			console.log(data);
		});
		/...
});
```

## Send messages

📂 /clientInsta/component/Chat.js

- Create a function `Chat()` which is a child of `ChatPage()` passe the following properties ([see above if you forgot](https://www.notion.so/My-Instagram-7b3fea63f0e2445ea04560719b15ad62))

```jsx
key={RoomID+Username}
room={RoomID}
username={Username}
socket={socket}
```

- Replace the chat input you did above with the function `Chat()` which
    - must return a chat input
    - must print the room ID and the username (given as props)

📂 /serverChat/index.js and 📂 /clientInsta/component/Chat.js

- Like you did to join a room, communicate with the server to send messages to all the users in a room ([see link](https://socket.io/docs/v3/rooms/#joining-and-leaving))
- The data that you send must contain the following properties

```jsx
room: props.room,
name: props.username,
message: currentMessage,
time: new Date(Date.now()).getHours() + ":" + new Date(Date.now()).getMinutes()
```

📂 /clientInsta/component/Chat.js

- Receive the messages from the server and add them to a useState value which will keep all the messages of the chat
    - You will need to use useEffect to check each time the socket receive an action ([see above](https://www.notion.so/My-Instagram-7b3fea63f0e2445ea04560719b15ad62))

🎯 Now you should be able to join a room which change the web page appearance, and send messages to every user in the same room as you

# 📝 Part 5 - Go further and master React

---

## Add the like button to every post and manage to make it work

📂 /clientInsta/component/Post.js

- You can see that there is a field named `image_like int(11) DEFAULT 0,` in your table IMAGES. If
    - image_like === 0 (not like)
    - image_like === 1 (like
- There are the heart logo in /clientInsta/assets/insta/
- What do you have to do
    - In ***/serverInsta/index.js*** add a new method PUT to change image_like value
    - In ***/clientInsta/component/Post.js*** make API call to change image_like value when the user click on the heart logo
        - Change heart logo, from **redLike.png** to **like.png**

## Add a login/register

- In the DB use the USERS table
- Instead of asking a username everywhere use the one the user logged in

## Delete posts on the feed

- Add a DELETE method to /serverInsta/index.js
- Include it on the front

## Keep the rooms data in the DB

- Use the ROOMS table to keep everything