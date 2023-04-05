using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class fin : MonoBehaviour
{
    public int cantidad = 14;
    public GameObject esta;
    public GameObject sig;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (cantidad ==0)
        {
            esta.SetActive(false);
            sig.SetActive(true);
        }
    }

    public void menos()
    {
        cantidad -= 1;
    }
}
