import React, { useEffect, useState } from 'react';

function App() {
  const [todos, setTodos] = useState([]);

  useEffect(() => {
    fetch('http://127.0.0.1:8000/todos')
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
