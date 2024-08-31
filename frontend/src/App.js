import React, { useEffect, useState } from 'react';
const apiUrl = process.env.REACT_APP_API_URL;
function App() {
  const [todos, setTodos] = useState([]);

  useEffect(() => {
    fetch(`${window.location.protocol}//${window.location.hostname}/todos`)
      .then((response) => response.json())
      .then((data) => setTodos(data.todos))
      .catch((error) => console.error('Error fetching todos:', error));
  }, []);

  return (
    <div>
      <h1>Todo List</h1>
      <ul>
        {todos.map((todo) => (
          <li key={todo.id}>
            {todo.task} - {todo.completed ? 'Completed' : 'Incomplete'}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default App;
