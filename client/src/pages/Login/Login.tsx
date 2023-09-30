import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { Page } from "../../components";
import { useAccountContext } from "../../context";
import "./Login.style.scss";

function Login() {
  const [message, setMessage] = useState(null);
  const { loggedIn, login } = useAccountContext();
  const navigate = useNavigate();
  const [email, setEmail] = useState("")
  const[password,setPassword] = useState("")
  // const email = document.getElementById("email").value;
  //const password = document.getElementById("password").value;

  //console.log(email,password);

  const attemptLogin = async () => {
    try {
      //const message = await login(email, password);
      const message = await login(email, password);
      setMessage(message);
    } catch (error) {
      console.log(error);
    }
  };

  useEffect(() => {
    if (loggedIn() === true) {
      navigate("/");
    }
  }, [loggedIn, navigate]);

  return (
    <Page>
      <div className="login-page">
        <h1>Login</h1>
        <button onClick={() => attemptLogin()}>
          Login (as user set in code)
        </button>

        <div>
        <label htmlFor="email">Email </label> 
        <input type="text" id="email" name="email" onChange={(e) => setEmail(e.target.value)}/>
        </div>

        <div>
        <label htmlFor="email">Password </label> 
        <input type="text" id="password" name="password" onChange={(d) => setPassword(d.target.value) }/>
        </div>
      
        <button onClick = {() => attemptLogin()}> 
          Login!
        </button>

        {message && <p>{message}</p>}
      </div>
    </Page>
  );
}

export default Login;
