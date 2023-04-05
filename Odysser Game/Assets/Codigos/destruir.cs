using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class destruir : MonoBehaviour
{
    public float vel;
    private fin final;

    // Start is called before the first frame update
    void Start()
    {
    
    }

    // Update is called once per frame
    void Update()
    {
        Rigidbody rb = gameObject.GetComponent<Rigidbody>();

        rb.AddForce(transform.forward * vel);
        Destroy(this.gameObject, 5);
    }

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.CompareTag("trash"))
        {
            Destroy(this.gameObject);
            final = FindObjectOfType<fin>();
            final.menos();
        }
    }
}
