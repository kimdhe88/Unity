using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LivingEntity : MonoBehaviour, IDamageable {

    public float startingHealth;
    protected float health;
    protected bool isDead;

    protected virtual void Start()
    {
        health = startingHealth;
    }

    public void TakeHit(float _damage, RaycastHit _hit)
    {
        health -= _damage;
        if(health <= 0)
        {
            Die();
        }
    }

    protected void Die()
    {
        isDead = true;
        GameObject.Destroy(gameObject);
    }
}
