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

    // Previz Gallery Toggle
    const previzToggleBtn = document.getElementById('previz-toggle');
    const previzDetails = document.getElementById('previz-details');

    if (previzToggleBtn && previzDetails) {
        previzToggleBtn.addEventListener('click', () => {
            const isHidden = previzDetails.style.display === 'none';
            previzDetails.style.display = isHidden ? 'block' : 'none';

            // Update Button Text
            if (isHidden) {
                previzToggleBtn.innerHTML = 'Hide Previz Gallery <span id="previz-toggle-icon">▲</span>';
                // Small delay to allow display:block to apply before scrolling
                setTimeout(() => {
                    const yOffset = -100; // Offset for fixed header
                    const y = previzDetails.getBoundingClientRect().top + window.pageYOffset + yOffset;
                    // Only scroll if the section is below the viewport
                    if (y > window.scrollY + window.innerHeight - 100) {
                        window.scrollTo({ top: y, behavior: 'smooth' });
                    }
                }, 50);
            } else {
                previzToggleBtn.innerHTML = 'View Previz Gallery <span id="previz-toggle-icon">▼</span>';
            }
        });
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
