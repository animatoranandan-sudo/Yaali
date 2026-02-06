document.addEventListener('DOMContentLoaded', () => {
    // Navigation Logic removed as per user request (top nav removed)

    // Smooth Scrolling for Anchor Links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            const targetElement = document.querySelector(targetId);

            if (targetElement) {
                // Adjust for fixed header height
                const headerOffset = 80;
                const elementPosition = targetElement.getBoundingClientRect().top;
                const offsetPosition = elementPosition + window.pageYOffset - headerOffset;

                window.scrollTo({
                    top: offsetPosition,
                    behavior: 'smooth'
                });
            }
        });
    });

    // Video Gallery Modal (Placeholder Logic)
    const videoThumbs = document.querySelectorAll('.video-thumb');

    videoThumbs.forEach(thumb => {
        thumb.addEventListener('click', () => {
            alert('Video Player Modal would open here. (Placeholder)');
        });
    });

    // Add scroll animation for elements
    const observerOptions = {
        threshold: 0.1
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);

    document.querySelectorAll('.content-section, .neon-btn').forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(20px)';
        el.style.transition = 'opacity 0.6s ease-out, transform 0.6s ease-out';
        observer.observe(el);
    });

    // Narrative Section Toggle
    const narrativeToggleBtn = document.getElementById('narrative-toggle');
    const narrativeDetails = document.getElementById('narrative-details');

    if (narrativeToggleBtn && narrativeDetails) {
        narrativeToggleBtn.addEventListener('click', () => {
            const isHidden = narrativeDetails.style.display === 'none';
            narrativeDetails.style.display = isHidden ? 'block' : 'none';

            // Update Button Text
            if (isHidden) {
                narrativeToggleBtn.innerHTML = 'Hide Story & World Details <span id="toggle-icon">▲</span>';
                // Small delay to allow display:block to apply before scrolling
                setTimeout(() => {
                    const yOffset = -100; // Offset for fixed header
                    const y = narrativeDetails.getBoundingClientRect().top + window.pageYOffset + yOffset;
                    window.scrollTo({ top: y, behavior: 'smooth' });
                }, 50);
            } else {
                narrativeToggleBtn.innerHTML = 'Explore Story & World Details <span id="toggle-icon">▼</span>';
            }
        });
    }

    // Previz Gallery Toggle & Password Protection
    const previzToggleBtn = document.getElementById('previz-toggle');
    const previzDetails = document.getElementById('previz-details');
    const previzPasswordModal = document.getElementById('previz-password-modal');
    const previzUnlockBtn = document.getElementById('previz-unlock-btn');
    const previzPasswordInput = document.getElementById('previz-password-input');
    const previzPasswordError = document.getElementById('previz-password-error');
    const closePrevizModal = document.querySelector('.close-previz-modal');
    let isPrevizUnlocked = false;

    if (previzToggleBtn && previzDetails) {
        previzToggleBtn.addEventListener('click', () => {
            if (previzDetails.style.display === 'block') { // block (from style)
                previzDetails.style.display = 'none';
                previzToggleBtn.innerHTML = 'View Previz Gallery <span id="previz-toggle-icon">▼</span>';
                return;
            }

            if (!isPrevizUnlocked) {
                previzPasswordModal.style.display = 'flex';
                previzPasswordInput.value = '';
                previzPasswordError.style.display = 'none';
                previzPasswordInput.focus();
                return;
            }

            showPreviz();
        });
    }

    function showPreviz() {
        previzDetails.style.display = 'block';
        previzToggleBtn.innerHTML = 'Hide Previz Gallery <span id="previz-toggle-icon">▲</span>';
        setTimeout(() => {
            const yOffset = -100;
            if (previzDetails) {
                const y = previzDetails.getBoundingClientRect().top + window.pageYOffset + yOffset;
                if (y > window.scrollY + window.innerHeight - 100) {
                    window.scrollTo({ top: y, behavior: 'smooth' });
                }
            }
        }, 50);
    }

    if (previzUnlockBtn) {
        previzUnlockBtn.addEventListener('click', checkPrevizPassword);
    }

    if (previzPasswordInput) {
        previzPasswordInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                checkPrevizPassword();
            }
        });
    }

    if (closePrevizModal) {
        closePrevizModal.addEventListener('click', () => {
            previzPasswordModal.style.display = 'none';
        });
    }

    if (previzPasswordModal) {
        previzPasswordModal.addEventListener('click', (e) => {
            if (e.target === previzPasswordModal) {
                previzPasswordModal.style.display = 'none';
            }
        });
    }

    function checkPrevizPassword() {
        const password = previzPasswordInput.value;
        if (password === '0404') {
            isPrevizUnlocked = true;
            previzPasswordModal.style.display = 'none';
            showPreviz();
        } else {
            previzPasswordError.style.display = 'block';
            previzPasswordModal.classList.add('shake');
            setTimeout(() => previzPasswordModal.classList.remove('shake'), 400);
        }
    }

    // Proof of Concept Toggle & Password Protection
    const pocToggleBtn = document.getElementById('poc-toggle');
    const pocDetails = document.getElementById('poc-details');
    const pocPasswordModal = document.getElementById('poc-password-modal');
    const pocUnlockBtn = document.getElementById('poc-unlock-btn');
    const pocPasswordInput = document.getElementById('poc-password-input');
    const pocPasswordError = document.getElementById('poc-password-error');
    const closePocModal = document.querySelector('.close-poc-modal');
    let isPocUnlocked = false;

    if (pocToggleBtn && pocDetails) {
        pocToggleBtn.addEventListener('click', () => {
            if (pocDetails.style.display === 'block') {
                pocDetails.style.display = 'none';
                pocToggleBtn.innerHTML = 'View Proof of Concept <span id="poc-toggle-icon">▼</span>';
                return;
            }

            if (!isPocUnlocked) {
                pocPasswordModal.style.display = 'flex';
                pocPasswordInput.value = '';
                pocPasswordError.style.display = 'none';
                pocPasswordInput.focus();
                return;
            }

            showPoc();
        });
    }

    function showPoc() {
        pocDetails.style.display = 'block';
        pocToggleBtn.innerHTML = 'Hide Proof of Concept <span id="poc-toggle-icon">▲</span>';
        setTimeout(() => {
            const yOffset = -100;
            if (pocDetails) {
                const y = pocDetails.getBoundingClientRect().top + window.pageYOffset + yOffset;
                if (y > window.scrollY + window.innerHeight - 100) {
                    window.scrollTo({ top: y, behavior: 'smooth' });
                }
            }
        }, 50);
    }

    if (pocUnlockBtn) {
        pocUnlockBtn.addEventListener('click', checkPocPassword);
    }

    if (pocPasswordInput) {
        pocPasswordInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                checkPocPassword();
            }
        });
    }

    if (closePocModal) {
        closePocModal.addEventListener('click', () => {
            pocPasswordModal.style.display = 'none';
        });
    }

    if (pocPasswordModal) {
        pocPasswordModal.addEventListener('click', (e) => {
            if (e.target === pocPasswordModal) {
                pocPasswordModal.style.display = 'none';
            }
        });
    }

    function checkPocPassword() {
        const password = pocPasswordInput.value;
        if (password === '0123') {
            isPocUnlocked = true;
            pocPasswordModal.style.display = 'none';
            showPoc();
        } else {
            pocPasswordError.style.display = 'block';
            pocPasswordModal.classList.add('shake');
            setTimeout(() => pocPasswordModal.classList.remove('shake'), 400);
        }
    }

    // Character & Location Description Toggle
    const descToggleBtn = document.getElementById('desc-toggle');
    const descDetails = document.getElementById('desc-details');

    if (descToggleBtn && descDetails) {
        descToggleBtn.addEventListener('click', () => {
            const isHidden = descDetails.style.display === 'none';
            descDetails.style.display = isHidden ? 'block' : 'none';

            if (isHidden) {
                descToggleBtn.innerHTML = 'Hide Character & Location Descriptions <span id="desc-toggle-icon">▲</span>';
                setTimeout(() => {
                    const yOffset = -100;
                    const y = descDetails.getBoundingClientRect().top + window.pageYOffset + yOffset;
                    window.scrollTo({ top: y, behavior: 'smooth' });
                }, 50);
            } else {
                descToggleBtn.innerHTML = 'View Character & Location Descriptions <span id="desc-toggle-icon">▼</span>';
            }
        });
    }

    // Scenes List Toggle & Password Protection
    const scenesToggleBtn = document.getElementById('scenes-toggle');
    const scenesDetails = document.getElementById('scenes-details');
    const passwordModal = document.getElementById('password-modal');
    const unlockBtn = document.getElementById('unlock-btn');
    const passwordInput = document.getElementById('password-input');
    const passwordError = document.getElementById('password-error');
    const closeModal = document.querySelector('.close-modal');
    let isScenesUnlocked = false;

    if (scenesToggleBtn && scenesDetails) {
        scenesToggleBtn.addEventListener('click', () => {
            // If already open, just close it
            if (scenesDetails.style.display === 'grid') {
                scenesDetails.style.display = 'none';
                scenesToggleBtn.innerHTML = 'View Scenes List <span id="scenes-toggle-icon">▼</span>';
                return;
            }

            // If not unlocked, show modal
            if (!isScenesUnlocked) {
                passwordModal.style.display = 'flex';
                passwordInput.value = ''; // Clear input
                passwordError.style.display = 'none'; // Hide error
                passwordInput.focus();
                return;
            }

            // If unlocked, show content
            showScenes();
        });
    }

    function showScenes() {
        scenesDetails.style.display = 'grid'; // Note: Scenes uses Grid
        scenesToggleBtn.innerHTML = 'Hide Scenes List <span id="scenes-toggle-icon">▲</span>';
        setTimeout(() => {
            const yOffset = -100;
            if (scenesDetails) {
                const y = scenesDetails.getBoundingClientRect().top + window.pageYOffset + yOffset;
                window.scrollTo({ top: y, behavior: 'smooth' });
            }
        }, 50);
    }

    // Modal Logic
    if (unlockBtn) {
        unlockBtn.addEventListener('click', checkPassword);
    }

    if (passwordInput) {
        passwordInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                checkPassword();
            }
        });
    }

    if (closeModal) {
        closeModal.addEventListener('click', () => {
            passwordModal.style.display = 'none';
        });
    }

    // Close modal if clicking outside
    if (passwordModal) {
        passwordModal.addEventListener('click', (e) => {
            if (e.target === passwordModal) {
                passwordModal.style.display = 'none';
            }
        });
    }

    function checkPassword() {
        const password = passwordInput.value;
        if (password === '0123') { // Simple client-side password
            isScenesUnlocked = true;
            passwordModal.style.display = 'none';
            showScenes();
        } else {
            passwordError.style.display = 'block';
            passwordModal.classList.add('shake'); // Optional visual feedback
            setTimeout(() => passwordModal.classList.remove('shake'), 400);
        }
    }
    // Game Pitch: Levels Toggle & Password Protection
    const levelsToggleBtn = document.getElementById('levels-toggle');
    const levelsDetails = document.getElementById('levels-details');
    const levelsPasswordModal = document.getElementById('levels-password-modal');
    const levelsUnlockBtn = document.getElementById('levels-unlock-btn');
    const levelsPasswordInput = document.getElementById('levels-password-input');
    const levelsPasswordError = document.getElementById('levels-password-error');
    const closeLevelsModal = document.querySelector('.close-levels-modal');
    let isLevelsUnlocked = false;

    if (levelsToggleBtn && levelsDetails) {
        levelsToggleBtn.addEventListener('click', () => {
            if (levelsDetails.style.display === 'block') { // block (table/div) not grid
                levelsDetails.style.display = 'none';
                levelsToggleBtn.innerHTML = 'View Levels with Gameplay/Cutscenes <span id="levels-toggle-icon">▼</span>';
                return;
            }

            if (!isLevelsUnlocked) {
                levelsPasswordModal.style.display = 'flex';
                levelsPasswordInput.value = '';
                levelsPasswordError.style.display = 'none';
                levelsPasswordInput.focus();
                return;
            }

            showLevels();
        });
    }

    function showLevels() {
        levelsDetails.style.display = 'block';
        levelsToggleBtn.innerHTML = 'Hide Levels with Gameplay/Cutscenes <span id="levels-toggle-icon">▲</span>';
        setTimeout(() => {
            const yOffset = -100;
            if (levelsDetails) {
                const y = levelsDetails.getBoundingClientRect().top + window.pageYOffset + yOffset;
                window.scrollTo({ top: y, behavior: 'smooth' });
            }
        }, 50);
    }

    if (levelsUnlockBtn) {
        levelsUnlockBtn.addEventListener('click', checkLevelsPassword);
    }

    if (levelsPasswordInput) {
        levelsPasswordInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                checkLevelsPassword();
            }
        });
    }

    if (closeLevelsModal) {
        closeLevelsModal.addEventListener('click', () => {
            levelsPasswordModal.style.display = 'none';
        });
    }

    if (levelsPasswordModal) {
        levelsPasswordModal.addEventListener('click', (e) => {
            if (e.target === levelsPasswordModal) {
                levelsPasswordModal.style.display = 'none';
            }
        });
    }

    function checkLevelsPassword() {
        const password = levelsPasswordInput.value;
        if (password === '5678') { // Different password for levels
            isLevelsUnlocked = true;
            levelsPasswordModal.style.display = 'none';
            showLevels();
        } else {
            levelsPasswordError.style.display = 'block';
            levelsPasswordModal.classList.add('shake');
            setTimeout(() => levelsPasswordModal.classList.remove('shake'), 400);
        }
    }

    // Animatic Toggle & Password Protection
    const animaticToggleBtn = document.getElementById('animatic-toggle');
    const animaticDetails = document.getElementById('animatic-details');
    const animaticPasswordModal = document.getElementById('animatic-password-modal');
    const animaticUnlockBtn = document.getElementById('animatic-unlock-btn');
    const animaticPasswordInput = document.getElementById('animatic-password-input');
    const animaticPasswordError = document.getElementById('animatic-password-error');
    const closeAnimaticModal = document.querySelector('.close-animatic-modal');
    let isAnimaticUnlocked = false;

    if (animaticToggleBtn && animaticDetails) {
        animaticToggleBtn.addEventListener('click', () => {
            if (animaticDetails.style.display === 'block') {
                animaticDetails.style.display = 'none';
                animaticToggleBtn.innerHTML = 'View Storyboard & Animatic <span id="animatic-toggle-icon">▼</span>';
                return;
            }

            if (!isAnimaticUnlocked) {
                animaticPasswordModal.style.display = 'flex';
                animaticPasswordInput.value = '';
                animaticPasswordError.style.display = 'none';
                animaticPasswordInput.focus();
                return;
            }

            showAnimatic();
        });
    }

    function showAnimatic() {
        animaticDetails.style.display = 'block';
        animaticToggleBtn.innerHTML = 'Hide Storyboard & Animatic <span id="animatic-toggle-icon">▲</span>';
        setTimeout(() => {
            const yOffset = -100;
            if (animaticDetails) {
                const y = animaticDetails.getBoundingClientRect().top + window.pageYOffset + yOffset;
                if (y > window.scrollY + window.innerHeight - 100) {
                    window.scrollTo({ top: y, behavior: 'smooth' });
                }
            }
        }, 50);
    }

    if (animaticUnlockBtn) {
        animaticUnlockBtn.addEventListener('click', checkAnimaticPassword);
    }

    if (animaticPasswordInput) {
        animaticPasswordInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                checkAnimaticPassword();
            }
        });
    }

    if (closeAnimaticModal) {
        closeAnimaticModal.addEventListener('click', () => {
            animaticPasswordModal.style.display = 'none';
        });
    }

    if (animaticPasswordModal) {
        animaticPasswordModal.addEventListener('click', (e) => {
            if (e.target === animaticPasswordModal) {
                animaticPasswordModal.style.display = 'none';
            }
        });
    }

    function checkAnimaticPassword() {
        const password = animaticPasswordInput.value;
        if (password === '0123') { // Same as POC
            isAnimaticUnlocked = true;
            animaticPasswordModal.style.display = 'none';
            showAnimatic();
        } else {
            animaticPasswordError.style.display = 'block';
            animaticPasswordModal.classList.add('shake');
            setTimeout(() => animaticPasswordModal.classList.remove('shake'), 400);
        }
    }
});

// Parallax Mouse-Tracking Effect for Hero Section
(function initParallax() {
    const hero = document.querySelector('.hero');
    const heroContent = document.querySelector('.hero-content');

    if (!hero || !heroContent) return;

    // Only enable on non-touch devices
    if ('ontouchstart' in window) return;

    hero.addEventListener('mousemove', (e) => {
        const rect = hero.getBoundingClientRect();
        const x = (e.clientX - rect.left) / rect.width - 0.5;
        const y = (e.clientY - rect.top) / rect.height - 0.5;

        requestAnimationFrame(() => {
            heroContent.style.transform = `
                translate3d(${x * 20}px, ${y * 20}px, 0)
                rotateY(${x * 5}deg)
                rotateX(${-y * 5}deg)
            `;
        });
    });

    hero.addEventListener('mouseleave', () => {
        heroContent.style.transform = 'translate3d(0, 0, 0) rotateY(0) rotateX(0)';
    });
})();
