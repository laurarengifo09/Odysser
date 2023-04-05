using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class destruir2 : MonoBehaviour
{
    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.CompareTag("bicho"))
        {
            Destroy(this.gameObject);
        }
    }
}
