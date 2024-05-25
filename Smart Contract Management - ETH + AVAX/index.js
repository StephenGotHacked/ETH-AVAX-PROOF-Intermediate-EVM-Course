import { useState } from "react";

export default function HomePage() {
    const [value1, setValue1] = useState(undefined);
    const [value2, setValue2] = useState(undefined);
    const [totalval, total] = useState(undefined);
    const [newValue1, setNewValue1] = useState("");
    const [newValue2, setNewValue2] = useState("");

    const updateValue1 = () => {
        if (newValue1 !== 0) {
            setValue1(newValue1);
            total(newValue1 * newValue2);
        }
    };

    const updateValue2 = () => {
        if (newValue2 !== 0) {
            setValue2(newValue2);
            total(newValue1 * newValue2);
        }
    };

    return (
        <div className="container">
            <h1>Simple Multiplication Calculator</h1>
            <label>Value 1: <span>{value1}</span></label><br /><br/>
            <input type="text" value={newValue1} onChange={(e) => setNewValue1(e.target.value)} placeholder="New Value" />
            <button onClick={updateValue1}>Set Value 1</button><br/> <br/><br/>

            <label>Value 2: <span>{value2}</span></label><br /><br/>
            <input type="text" value={newValue2} onChange={(e) => setNewValue2(e.target.value)} placeholder="New Value" />
            <button onClick={updateValue2}>Set Value 2</button><br/> <br/>

            <label>Total: <span>{totalval}</span></label>
            <style jsx>{`
                .container{
                    text-align: center;
                    margin-top: 150pt;
                }
                input{
                    text-align: center;
                    border:0;
                    border-bottom: 2pt solid gray;
                    margin-right: 10pt;
                    width: 50pt;
                }

                span{
                    font-weight: bold;
                    text-decoration: underline;
                }

                
            `}</style>
        </div>
    );
}