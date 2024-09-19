document.addEventListener('DOMContentLoaded', function() {
    autologin(); // Appelle la fonction autologin au chargement de la page
    const form = document.querySelector('.login100-form');

    form.addEventListener('submit', handleFormSubmit);
});

// Fonction pour gérer la soumission du formulaire
function handleFormSubmit(event) {
    event.preventDefault(); // Empêche la soumission de formulaire par défaut

    // Récupère les valeurs des champs
    const email_input = document.querySelector('input[name="email TSP ou prenom.nom"]').value;
    const password = document.querySelector('input[name="pass"]').value.trim(); // Supprime les espaces inutiles

    if (!validateForm(email_input, password)) {
        return;
    }

    // Traite l'email
    const email = formatEmail(email_input);

    // Envoie la requête d'authentification
    authenticateUser(email, password);
}

// Fonction pour valider les entrées du formulaire
function validateForm(email_input, password) {
    if (!email_input || !password) {
        alert('Veuillez entrer un email et un mot de passe.');
        return false;
    }
    return true;
}

// Fonction pour formater l'email
function formatEmail(email_input) {
    let email = email_input.trim(); // Supprime les espaces
    email = email.replace(/\s+(?!$)/g, '_').replace(/^\s+|\s+$/g, '');
    if (email.includes('@')) {
        return email.split('@')[0] + '@telecom-sudparis.eu';
    } else {
        return email + '@telecom-sudparis.eu';
    }
}

// Fonction pour authentifier l'utilisateur via l'API
function authenticateUser(email, password) {
    fetch('https://fisa-link.duckdns.org/api/login/', { 
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRFToken': getCSRFToken()
        },
        body: JSON.stringify({
            email: email,
            password: password
        })
    })
    .then(handleResponse)
    .catch(handleError);
}

// Fonction pour gérer la réponse de l'API
function handleResponse(response) {
    if (!response.ok) {
        throw new Error('La réponse du réseau n\'était pas correcte');
    }
    return response.json().then(data => {
        if (data.status === 'success') {
            window.location.href = '/dashboard';  // Redirection en cas de succès
        } else {
            alert(data.message);  // Affiche un message en cas d'erreur
        }
    });
}

// Fonction pour gérer les erreurs de requête
function handleError(error) {
    console.error('Erreur:', error);
    alert('Une erreur est survenue lors de la connexion.');
}

// Fonction pour auto-login
function autologin() {
    fetch('https://fisa-link.duckdns.org/api/auto_login/', { 
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRFToken': getCSRFToken()
        }
    })
    .then(response => {
        return response.json();
    })
    .then(data => {
        if (data.status === 'success') {
            // Rediriger vers le dashboard si le token est valide
            window.location.href = '/dashboard';
        }
    })
    .catch(error => {
        console.error('Erreur lors de la tentative de connexion automatique:', error);
    });
}

// Fonction pour obtenir le token CSRF
function getCSRFToken() {
    const csrfTokenInput = document.querySelector('input[name="csrfmiddlewaretoken"]');
    return csrfTokenInput ? csrfTokenInput.value : '';
}
