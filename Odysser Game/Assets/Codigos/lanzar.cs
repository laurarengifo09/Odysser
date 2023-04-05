using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class lanzar : MonoBehaviour
{
    public GameObject mira;
    public GameObject roca;
    //public float vel;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void Disparar()
    {
        GameObject objetoTemporal = Instantiate(roca, mira.transform.position, mira.transform.rotation) as GameObject;

        //Rigidbody rb = objetoTemporal.GetComponent<Rigidbody>();

        //rb.AddForce(transform.forward * vel);
    }
}
