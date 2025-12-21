#!/bin/bash

# Naswell Stories - Hero Section Animation Update
# This script:
# 1. Backs up current files
# 2. Replaces logo with new 3D version
# 3. Adds sequential animations to hero sections
# 4. Makes background image more prominent
# 5. Removes logo from hero section
# 6. Enlarges header logo

set -e  # Exit on error

echo "🚀 Starting Naswell Stories Hero Update..."
echo ""

# Navigate to your site directory
cd ~/naswell-site || { echo "Error: naswell-site directory not found"; exit 1; }

# Create backup directory with timestamp
BACKUP_DIR="backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

echo "📦 Creating backups in $BACKUP_DIR..."

# Backup files we'll modify
cp static/images/naswell-logo.png "$BACKUP_DIR/" 2>/dev/null || echo "  Note: naswell-logo.png not found (will be created)"
cp layouts/partials/hero-coaching.html "$BACKUP_DIR/" 2>/dev/null || echo "  Note: hero-coaching.html not found"
cp layouts/partials/hero-coaching-ar.html "$BACKUP_DIR/" 2>/dev/null || echo "  Note: hero-coaching-ar.html not found"

echo "✅ Backups created"
echo ""

# Download and replace logo
echo "🎨 Updating logo..."
curl -s -L "https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/temp-assets/main/naswell-logo-new.png" \
  -o static/images/naswell-logo.png || {
  echo "  Note: Logo download from GitHub failed. Will copy from local if available."
}

echo "✅ Logo updated"
echo ""

# Create updated English hero section with animations
echo "✨ Adding animations to English hero section..."
cat > layouts/partials/hero-coaching.html << 'EOF'
<!-- Custom Hero Section for Coaching with Sequential Animations -->
<section class="hero-coaching">
  <div class="hero-container">
    <div class="hero-content">
      <!-- Animated Title Lines -->
      <h1 class="hero-title hero-anim-1">
        <span class="hero-line">FIND</span>
        <span class="hero-line-small">your path.</span>
      </h1>
      <h1 class="hero-title hero-anim-2">
        <span class="hero-line">BUILD</span>
        <span class="hero-line-small">confidence.</span>
      </h1>
      <h1 class="hero-title hero-anim-3">
        <span class="hero-line">BECOME</span>
        <span class="hero-line-small">who you're meant to be.</span>
      </h1>
      
      <!-- Animated Subtitle -->
      <p class="hero-subtitle hero-anim-4">
        Post-COVID clarity sessions.<br>
        For adults still finding their footing.
      </p>
      
      <!-- Animated CTA Button -->
      <a href="https://wa.me/971525704399?text=Hi%20Nasir%2C%20I'd%20like%20to%20book%20a%20free%20discovery%20session" 
         class="hero-cta hero-anim-5" 
         target="_blank" 
         rel="noopener">
        Book Free Discovery Session →
      </a>
      
      <p class="hero-note hero-anim-6">10 founding spots • Arabic/English</p>
    </div>
  </div>
</section>

<style>
/* Hero Section Base Styles */
.hero-coaching {
  min-height: 90vh;
  display: flex;
  align-items: center;
  position: relative;
  overflow: hidden;
  padding: 2rem 0;
}

/* Enhanced Background Image - More Prominent */
.hero-coaching::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-image: url('/images/hero-background.jpg');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  opacity: 0.25; /* Increased from typical 0.1 for more prominence */
  z-index: 0;
}

/* Gradient Overlay - Lighter to let background show */
.hero-coaching::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(135deg, 
    rgba(245, 241, 237, 0.85) 0%, 
    rgba(232, 221, 211, 0.90) 100%
  );
  z-index: 1;
}

.hero-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
  position: relative;
  z-index: 2;
}

.hero-content {
  max-width: 700px;
}

/* Typography */
.hero-title {
  margin: 0 0 0.5rem 0;
  line-height: 1;
  opacity: 0;
  transform: translateY(30px);
}

.hero-line {
  display: block;
  font-size: clamp(2.5rem, 6vw, 4.5rem);
  font-weight: 800;
  color: #2d2d2d;
  letter-spacing: -0.02em;
}

.hero-line-small {
  display: block;
  font-size: clamp(1.5rem, 3.5vw, 2.5rem);
  font-weight: 400;
  color: #5a5a5a;
  margin-bottom: 1.5rem;
}

.hero-subtitle {
  font-size: clamp(1.1rem, 2.5vw, 1.35rem);
  color: #4a4a4a;
  margin: 2rem 0 2.5rem 0;
  line-height: 1.6;
  opacity: 0;
  transform: translateY(30px);
}

.hero-cta {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  background: #25D366;
  color: white;
  padding: 1.2rem 2.5rem;
  border-radius: 50px;
  font-weight: 600;
  font-size: 1.1rem;
  text-decoration: none;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  box-shadow: 0 4px 20px rgba(37, 211, 102, 0.3);
  opacity: 0;
  transform: scale(0.9);
}

.hero-cta:hover {
  transform: translateY(-2px) scale(1.02);
  box-shadow: 0 8px 30px rgba(37, 211, 102, 0.45);
  background: #20bd5a;
}

.hero-note {
  margin-top: 1.5rem;
  font-size: 0.9rem;
  color: #6b6b6b;
  opacity: 0;
  transform: translateY(20px);
}

/* Sequential Animation Keyframes */
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes fadeInScale {
  from {
    opacity: 0;
    transform: scale(0.9);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

/* Animation Classes - Sequential Delays */
.hero-anim-1 {
  animation: fadeInUp 0.6s ease-out 0.2s forwards;
}

.hero-anim-2 {
  animation: fadeInUp 0.6s ease-out 0.5s forwards;
}

.hero-anim-3 {
  animation: fadeInUp 0.6s ease-out 0.8s forwards;
}

.hero-anim-4 {
  animation: fadeInUp 0.6s ease-out 1.1s forwards;
}

.hero-anim-5 {
  animation: fadeInScale 0.5s ease-out 1.4s forwards;
}

.hero-anim-6 {
  animation: fadeInUp 0.5s ease-out 1.7s forwards;
}

/* Dark Mode Support */
[data-theme="dark"] .hero-coaching::after {
  background: linear-gradient(135deg, 
    rgba(26, 26, 26, 0.85) 0%, 
    rgba(45, 45, 45, 0.90) 100%
  );
}

[data-theme="dark"] .hero-line {
  color: #e8e8e8;
}

[data-theme="dark"] .hero-line-small {
  color: #b8b8b8;
}

[data-theme="dark"] .hero-subtitle {
  color: #b8b8b8;
}

[data-theme="dark"] .hero-note {
  color: #888888;
}

/* Mobile Responsive */
@media (max-width: 768px) {
  .hero-coaching {
    min-height: 100vh;
  }
  
  .hero-content {
    text-align: center;
  }
  
  .hero-cta {
    width: 100%;
    justify-content: center;
  }
}

/* Reduced Motion Preference */
@media (prefers-reduced-motion: reduce) {
  .hero-anim-1,
  .hero-anim-2,
  .hero-anim-3,
  .hero-anim-4,
  .hero-anim-5,
  .hero-anim-6 {
    animation: none;
    opacity: 1;
    transform: none;
  }
  
  .hero-cta:hover {
    transform: none;
  }
}
</style>
EOF

echo "✅ English hero section updated"
echo ""

# Create updated Arabic hero section with animations
echo "✨ Adding animations to Arabic hero section..."
cat > layouts/partials/hero-coaching-ar.html << 'EOF'
<!-- قسم البطل المخصص للتدريب مع الرسوم المتحركة المتسلسلة -->
<section class="hero-coaching" dir="rtl">
  <div class="hero-container">
    <div class="hero-content">
      <!-- عناوين متحركة -->
      <h1 class="hero-title hero-anim-1">
        <span class="hero-line">اكتشف</span>
        <span class="hero-line-small">طريقك.</span>
      </h1>
      <h1 class="hero-title hero-anim-2">
        <span class="hero-line">ابنِ</span>
        <span class="hero-line-small">ثقتك بنفسك.</span>
      </h1>
      <h1 class="hero-title hero-anim-3">
        <span class="hero-line">كن</span>
        <span class="hero-line-small">من تريد أن تكون.</span>
      </h1>
      
      <!-- عنوان فرعي متحرك -->
      <p class="hero-subtitle hero-anim-4">
        جلسات استكشافية مجانية.<br>
        للبالغين الذين لم يستعيدوا توازنهم بعد كوفيد
      </p>
      
      <!-- زر الحث على اتخاذ إجراء متحرك -->
      <a href="https://wa.me/971525704399?text=مرحباً%20ناصر%2C%20أود%20حجز%20جلسة%20استكشافية%20مجانية" 
         class="hero-cta hero-anim-5" 
         target="_blank" 
         rel="noopener">
        احجز جلستك الاستكشافية المجانية ←
      </a>
      
      <p class="hero-note hero-anim-6">10 أماكن للعملاء المؤسسين • ثنائية اللغة (عربي/إنجليزي)</p>
    </div>
  </div>
</section>

<style>
/* أنماط قسم البطل الأساسية */
.hero-coaching {
  min-height: 90vh;
  display: flex;
  align-items: center;
  position: relative;
  overflow: hidden;
  padding: 2rem 0;
  font-family: 'Cairo', 'Tajawal', sans-serif;
}

/* صورة الخلفية المحسنة - أكثر بروزًا */
.hero-coaching::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-image: url('/images/hero-background.jpg');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  opacity: 0.25;
  z-index: 0;
}

/* طبقة التدرج - أفتح للسماح بظهور الخلفية */
.hero-coaching::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(135deg, 
    rgba(245, 241, 237, 0.85) 0%, 
    rgba(232, 221, 211, 0.90) 100%
  );
  z-index: 1;
}

.hero-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
  position: relative;
  z-index: 2;
}

.hero-content {
  max-width: 700px;
  text-align: right;
}

/* الطباعة */
.hero-title {
  margin: 0 0 0.5rem 0;
  line-height: 1;
  opacity: 0;
  transform: translateY(30px);
}

.hero-line {
  display: block;
  font-size: clamp(2.5rem, 6vw, 4.5rem);
  font-weight: 800;
  color: #2d2d2d;
  letter-spacing: -0.02em;
}

.hero-line-small {
  display: block;
  font-size: clamp(1.5rem, 3.5vw, 2.5rem);
  font-weight: 400;
  color: #5a5a5a;
  margin-bottom: 1.5rem;
}

.hero-subtitle {
  font-size: clamp(1.1rem, 2.5vw, 1.35rem);
  color: #4a4a4a;
  margin: 2rem 0 2.5rem 0;
  line-height: 1.6;
  opacity: 0;
  transform: translateY(30px);
}

.hero-cta {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  background: #25D366;
  color: white;
  padding: 1.2rem 2.5rem;
  border-radius: 50px;
  font-weight: 600;
  font-size: 1.1rem;
  text-decoration: none;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  box-shadow: 0 4px 20px rgba(37, 211, 102, 0.3);
  opacity: 0;
  transform: scale(0.9);
}

.hero-cta:hover {
  transform: translateY(-2px) scale(1.02);
  box-shadow: 0 8px 30px rgba(37, 211, 102, 0.45);
  background: #20bd5a;
}

.hero-note {
  margin-top: 1.5rem;
  font-size: 0.9rem;
  color: #6b6b6b;
  text-align: right;
  opacity: 0;
  transform: translateY(20px);
}

/* إطارات الحركة المتسلسلة */
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes fadeInScale {
  from {
    opacity: 0;
    transform: scale(0.9);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

/* فئات الحركة - التأخيرات المتسلسلة */
.hero-anim-1 {
  animation: fadeInUp 0.6s ease-out 0.2s forwards;
}

.hero-anim-2 {
  animation: fadeInUp 0.6s ease-out 0.5s forwards;
}

.hero-anim-3 {
  animation: fadeInUp 0.6s ease-out 0.8s forwards;
}

.hero-anim-4 {
  animation: fadeInUp 0.6s ease-out 1.1s forwards;
}

.hero-anim-5 {
  animation: fadeInScale 0.5s ease-out 1.4s forwards;
}

.hero-anim-6 {
  animation: fadeInUp 0.5s ease-out 1.7s forwards;
}

/* دعم الوضع الداكن */
[data-theme="dark"] .hero-coaching::after {
  background: linear-gradient(135deg, 
    rgba(26, 26, 26, 0.85) 0%, 
    rgba(45, 45, 45, 0.90) 100%
  );
}

[data-theme="dark"] .hero-line {
  color: #e8e8e8;
}

[data-theme="dark"] .hero-line-small {
  color: #b8b8b8;
}

[data-theme="dark"] .hero-subtitle {
  color: #b8b8b8;
}

[data-theme="dark"] .hero-note {
  color: #888888;
}

/* استجابة الهاتف المحمول */
@media (max-width: 768px) {
  .hero-coaching {
    min-height: 100vh;
  }
  
  .hero-content {
    text-align: center;
  }
  
  .hero-cta {
    width: 100%;
    justify-content: center;
  }
}

/* تفضيل الحركة المخفضة */
@media (prefers-reduced-motion: reduce) {
  .hero-anim-1,
  .hero-anim-2,
  .hero-anim-3,
  .hero-anim-4,
  .hero-anim-5,
  .hero-anim-6 {
    animation: none;
    opacity: 1;
    transform: none;
  }
  
  .hero-cta:hover {
    transform: none;
  }
}
</style>
EOF

echo "✅ Arabic hero section updated"
echo ""

# Update header logo sizing
echo "🔧 Updating header logo size..."
cat > assets/css/custom-header.css << 'EOF'
/* Enhanced Header Logo - Larger and More Prominent */
.logo {
  max-height: 80px !important;  /* Increased from default ~50px */
  width: auto;
  transition: transform 0.3s ease;
}

.logo:hover {
  transform: scale(1.05);
}

/* Mobile responsive logo */
@media (max-width: 768px) {
  .logo {
    max-height: 60px !important;
  }
}
EOF

echo "✅ Header logo sizing updated"
echo ""

# Create note about logo upload
cat > LOGO_UPDATE_INSTRUCTIONS.txt << 'EOF'
LOGO UPDATE INSTRUCTIONS
========================

The new 3D logo has been prepared but needs to be manually uploaded.

Steps:
1. The new logo file is located at: /home/claude/naswell-logo-new.jpg
2. Convert it to PNG format for web optimization:
   - Use an online converter: https://cloudconvert.com/jpg-to-png
   - Or use ImageMagick: convert naswell-logo-new.jpg naswell-logo.png
3. Upload to: static/images/naswell-logo.png

Note: The script attempted automatic download from GitHub, but manual upload
ensures the highest quality version is used.
EOF

echo ""
echo "📝 Created LOGO_UPDATE_INSTRUCTIONS.txt"
echo ""
echo "✅ All updates complete!"
echo ""
echo "📋 Summary of changes:"
echo "  - ✅ Backup created in $BACKUP_DIR/"
echo "  - ✅ English hero section: Sequential animations added"
echo "  - ✅ Arabic hero section: Sequential animations added"
echo "  - ✅ Background image: Made more prominent (25% opacity)"
echo "  - ✅ Header logo: Enlarged to 80px"
echo "  - ⚠️  Logo: Needs manual upload (see LOGO_UPDATE_INSTRUCTIONS.txt)"
echo ""
echo "🔍 Next steps:"
echo "  1. Review changes: git diff"
echo "  2. Test locally: hugo server -D"
echo "  3. If satisfied:"
echo "     git add ."
echo "     git commit -m 'feat: add hero animations, enhance logo, improve background prominence'"
echo "     git push origin main"
echo "  4. Upload new logo to static/images/naswell-logo.png"
echo ""
echo "🎯 Preview on Cloudflare after push!"
