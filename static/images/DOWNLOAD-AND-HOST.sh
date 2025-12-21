#!/bin/bash

cd C:/Users/HP/naswell-site || exit 1

echo "📥 Downloading images to host locally..."

# Create images directory
mkdir -p static/images

# Download all 5 images from Unsplash
curl -L "https://images.unsplash.com/photo-1492681290082-e932832941e6?w=1200&q=80" -o static/images/stuck-forest-path.jpg
curl -L "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=1200&q=80" -o static/images/overthinking-stress.jpg
curl -L "https://images.unsplash.com/photo-1584931423298-c576fda54bd2?w=1200&q=80" -o static/images/exhausted-couch.jpg
curl -L "https://images.unsplash.com/photo-1512941937669-90a1b58e7e9c?w=1200&q=80" -o static/images/booking-phone.jpg
curl -L "https://images.unsplash.com/photo-1588196749597-9ff075ee6b5b?w=1200&q=80" -o static/images/video-call.jpg
curl -L "https://images.unsplash.com/photo-1455390582262-044cdead277a?w=1200&q=80" -o static/images/journal-writing.jpg

echo "✅ Images downloaded"

# Update English pain points
cat > layouts/partials/who-this-is-for.html << 'HTML1'
<section class="who-this-is-for">
  <div class="section-container">
    <h2 class="section-title">Is This For You?</h2>
    <p class="section-subtitle">You're in the right place if you're feeling:</p>
    
    <div class="pain-points-grid">
      <div class="pain-card">
        <div class="pain-image-wrapper">
          <img src="/images/stuck-forest-path.jpg" 
               alt="Stuck between chapters" 
               class="pain-image"
               loading="lazy">
        </div>
        <div class="pain-content">
          <h3 class="pain-title">Stuck Between Chapters</h3>
          <p class="pain-description">
            Not who you were.<br>
            Not yet who you want to be.<br>
            Caught in transition.
          </p>
        </div>
      </div>
      
      <div class="pain-card">
        <div class="pain-image-wrapper">
          <img src="/images/overthinking-stress.jpg" 
               alt="Overthinking everything" 
               class="pain-image"
               loading="lazy">
        </div>
        <div class="pain-content">
          <h3 class="pain-title">Overthinking Everything</h3>
          <p class="pain-description">
            Analyze every decision to death.<br>
            Struggle to take action.<br>
            Paralysis by analysis.
          </p>
        </div>
      </div>
      
      <div class="pain-card">
        <div class="pain-image-wrapper">
          <img src="/images/exhausted-couch.jpg" 
               alt="Emotionally exhausted" 
               class="pain-image"
               loading="lazy">
        </div>
        <div class="pain-content">
          <h3 class="pain-title">Emotionally Exhausted</h3>
          <p class="pain-description">
            High-functioning outside.<br>
            Running on empty inside.<br>
            Help others, struggle with yourself.
          </p>
        </div>
      </div>
    </div>
    
    <div class="for-you-statement">
      <div class="statement-icon">✓</div>
      <p>
        If any of these resonate, you're in the right place.<br>
        <strong>Let's turn clarity into confident action.</strong>
      </p>
    </div>
  </div>
</section>

<style>
.who-this-is-for {
  padding: clamp(4rem, 8vw, 8rem) 0;
  background: linear-gradient(135deg, #e8ddd3 0%, #d4c4b7 100%);
}

[data-theme="dark"] .who-this-is-for {
  background: linear-gradient(135deg, #2d2d2d 0%, #1a1a1a 100%);
}

.pain-points-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2.5rem;
  margin: 3rem 0 4rem;
}

.pain-card {
  background: white;
  border-radius: 20px;
  overflow: hidden;
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

[data-theme="dark"] .pain-card {
  background: #2d2d2d;
}

.pain-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
}

.pain-image-wrapper {
  width: 100%;
  height: 200px;
  overflow: hidden;
}

.pain-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.4s ease;
}

.pain-card:hover .pain-image {
  transform: scale(1.08);
}

.pain-content {
  padding: 2rem;
  text-align: center;
}

.pain-title {
  font-size: clamp(1.3rem, 2.5vw, 1.5rem);
  font-weight: 700;
  color: var(--text-primary);
  margin-bottom: 1rem;
}

.pain-description {
  font-size: 1rem;
  color: var(--text-secondary);
  line-height: 1.9;
  margin: 0;
}

.for-you-statement {
  text-align: center;
  background: white;
  padding: 3rem 2rem;
  border-radius: 20px;
  box-shadow: 0 15px 50px rgba(37, 211, 102, 0.2);
  max-width: 700px;
  margin: 0 auto;
}

[data-theme="dark"] .for-you-statement {
  background: #2d2d2d;
}

.statement-icon {
  width: 60px;
  height: 60px;
  background: #25D366;
  color: white;
  font-size: 2rem;
  font-weight: 800;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 1.5rem;
  box-shadow: 0 6px 25px rgba(37, 211, 102, 0.4);
}

.for-you-statement p {
  font-size: clamp(1.1rem, 2.5vw, 1.25rem);
  color: var(--text-primary);
  line-height: 1.8;
  margin: 0;
}

.for-you-statement strong {
  color: #25D366;
  font-weight: 700;
}

@media (max-width: 768px) {
  .pain-points-grid {
    grid-template-columns: 1fr;
    gap: 2rem;
  }
  
  .pain-image-wrapper {
    height: 180px;
  }
  
  .pain-content {
    padding: 1.5rem;
  }
  
  .for-you-statement {
    padding: 2.5rem 1.5rem;
  }
}
</style>
HTML1

# Update English steps
cat > layouts/partials/how-it-works.html << 'HTML2'
<section class="how-it-works">
  <div class="section-container">
    <h2 class="section-title">How It Works</h2>
    <p class="section-subtitle">Three simple steps to get started.</p>
    
    <div class="steps-grid">
      <div class="step-card">
        <div class="step-image-wrapper">
          <img src="/images/booking-phone.jpg" 
               alt="Book session" 
               class="step-image"
               loading="lazy">
          <div class="step-number">1</div>
        </div>
        <h3 class="step-title">Book Your Session</h3>
        <p class="step-description">
          Quick WhatsApp message.<br>
          Find a time that works.
        </p>
      </div>
      
      <div class="step-card">
        <div class="step-image-wrapper">
          <img src="/images/video-call.jpg" 
               alt="Connect and explore" 
               class="step-image"
               loading="lazy">
          <div class="step-number">2</div>
        </div>
        <h3 class="step-title">Connect & Explore</h3>
        <p class="step-description">
          Where you are.<br>
          Where you want to be.<br>
          What's in the way.
        </p>
      </div>
      
      <div class="step-card">
        <div class="step-image-wrapper">
          <img src="/images/journal-writing.jpg" 
               alt="Take action" 
               class="step-image"
               loading="lazy">
          <div class="step-number">3</div>
        </div>
        <h3 class="step-title">Take Action</h3>
        <p class="step-description">
          Practical next steps.<br>
          Real progress.<br>
          Not just good feelings.
        </p>
      </div>
    </div>
  </div>
</section>

<style>
.how-it-works {
  padding: clamp(4rem, 8vw, 8rem) 0;
  background: var(--bg-secondary);
}

.steps-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 3rem;
  margin-top: 3rem;
}

.step-card {
  text-align: center;
  padding: 0;
  border-radius: 20px;
  background: white;
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
  overflow: hidden;
}

[data-theme="dark"] .step-card {
  background: #2d2d2d;
}

.step-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
}

.step-image-wrapper {
  position: relative;
  width: 100%;
  height: 220px;
  overflow: hidden;
}

.step-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.4s ease;
}

.step-card:hover .step-image {
  transform: scale(1.05);
}

.step-number {
  position: absolute;
  top: 20px;
  right: 20px;
  width: 60px;
  height: 60px;
  background: #25D366;
  color: white;
  font-size: 1.75rem;
  font-weight: 800;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 0 6px 25px rgba(37, 211, 102, 0.4);
  transition: all 0.3s ease;
}

.step-card:hover .step-number {
  transform: scale(1.15) rotate(8deg);
}

.step-title {
  font-size: clamp(1.4rem, 3vw, 1.65rem);
  font-weight: 700;
  color: var(--text-primary);
  margin: 1.5rem 1.5rem 1rem;
  transition: color 0.3s ease;
}

.step-card:hover .step-title {
  color: #25D366;
}

.step-description {
  font-size: 1.05rem;
  color: var(--text-secondary);
  line-height: 1.8;
  margin: 0 1.5rem 2rem;
}

@media (max-width: 768px) {
  .steps-grid {
    grid-template-columns: 1fr;
    gap: 2.5rem;
  }
  
  .step-image-wrapper {
    height: 200px;
  }
  
  .step-number {
    width: 50px;
    height: 50px;
    font-size: 1.5rem;
  }
}
</style>
HTML2

# Update Arabic pain points
cat > layouts/partials/who-this-is-for-ar.html << 'HTML3'
<section class="who-this-is-for" dir="rtl">
  <div class="section-container">
    <h2 class="section-title">هل هذا لك؟</h2>
    <p class="section-subtitle">أنت في المكان الصحيح إذا كنت تشعر بـ:</p>
    
    <div class="pain-points-grid">
      <div class="pain-card">
        <div class="pain-image-wrapper">
          <img src="/images/stuck-forest-path.jpg" 
               alt="عالق بين فصول" 
               class="pain-image"
               loading="lazy">
        </div>
        <div class="pain-content">
          <h3 class="pain-title">عالق بين فصول</h3>
          <p class="pain-description">
            لست من كنت.<br>
            لست بعد من تريد أن تكون.<br>
            محاصر في الانتقال.
          </p>
        </div>
      </div>
      
      <div class="pain-card">
        <div class="pain-image-wrapper">
          <img src="/images/overthinking-stress.jpg" 
               alt="التفكير الزائد" 
               class="pain-image"
               loading="lazy">
        </div>
        <div class="pain-content">
          <h3 class="pain-title">التفكير الزائد في كل شيء</h3>
          <p class="pain-description">
            تحليل كل قرار حتى الموت.<br>
            الكفاح لاتخاذ إجراء.<br>
            الشلل من التحليل.
          </p>
        </div>
      </div>
      
      <div class="pain-card">
        <div class="pain-image-wrapper">
          <img src="/images/exhausted-couch.jpg" 
               alt="منهك عاطفياً" 
               class="pain-image"
               loading="lazy">
        </div>
        <div class="pain-content">
          <h3 class="pain-title">منهك عاطفياً</h3>
          <p class="pain-description">
            عالي الأداء من الخارج.<br>
            تعمل على فراغ من الداخل.<br>
            تساعد الآخرين، تكافح مع نفسك.
          </p>
        </div>
      </div>
    </div>
    
    <div class="for-you-statement">
      <div class="statement-icon">✓</div>
      <p>
        إذا كان أي من هذه يتردد صداه، فأنت في المكان الصحيح.<br>
        <strong>لنحول الوضوح إلى عمل واثق.</strong>
      </p>
    </div>
  </div>
</section>

<style>
.who-this-is-for {
  padding: clamp(4rem, 8vw, 8rem) 0;
  background: linear-gradient(135deg, #e8ddd3 0%, #d4c4b7 100%);
}

.who-this-is-for[dir="rtl"] {
  font-family: 'Cairo', 'Tajawal', sans-serif;
}

[data-theme="dark"] .who-this-is-for {
  background: linear-gradient(135deg, #2d2d2d 0%, #1a1a1a 100%);
}

.pain-points-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2.5rem;
  margin: 3rem 0 4rem;
}

.pain-card {
  background: white;
  border-radius: 20px;
  overflow: hidden;
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

[data-theme="dark"] .pain-card {
  background: #2d2d2d;
}

.pain-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
}

.pain-image-wrapper {
  width: 100%;
  height: 200px;
  overflow: hidden;
}

.pain-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.4s ease;
}

.pain-card:hover .pain-image {
  transform: scale(1.08);
}

.pain-content {
  padding: 2rem;
  text-align: center;
}

.pain-title {
  font-size: clamp(1.3rem, 2.5vw, 1.5rem);
  font-weight: 700;
  color: var(--text-primary);
  margin-bottom: 1rem;
}

.pain-description {
  font-size: 1rem;
  color: var(--text-secondary);
  line-height: 1.9;
  margin: 0;
}

.for-you-statement {
  text-align: center;
  background: white;
  padding: 3rem 2rem;
  border-radius: 20px;
  box-shadow: 0 15px 50px rgba(37, 211, 102, 0.2);
  max-width: 700px;
  margin: 0 auto;
}

[data-theme="dark"] .for-you-statement {
  background: #2d2d2d;
}

.statement-icon {
  width: 60px;
  height: 60px;
  background: #25D366;
  color: white;
  font-size: 2rem;
  font-weight: 800;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 1.5rem;
  box-shadow: 0 6px 25px rgba(37, 211, 102, 0.4);
}

.for-you-statement p {
  font-size: clamp(1.1rem, 2.5vw, 1.25rem);
  color: var(--text-primary);
  line-height: 1.8;
  margin: 0;
}

.for-you-statement strong {
  color: #25D366;
  font-weight: 700;
}

@media (max-width: 768px) {
  .pain-points-grid {
    grid-template-columns: 1fr;
    gap: 2rem;
  }
  
  .pain-image-wrapper {
    height: 180px;
  }
  
  .pain-content {
    padding: 1.5rem;
  }
  
  .for-you-statement {
    padding: 2.5rem 1.5rem;
  }
}
</style>
HTML3

# Update Arabic steps
cat > layouts/partials/how-it-works-ar.html << 'HTML4'
<section class="how-it-works" dir="rtl">
  <div class="section-container">
    <h2 class="section-title">كيف يعمل</h2>
    <p class="section-subtitle">ثلاث خطوات بسيطة للبدء.</p>
    
    <div class="steps-grid">
      <div class="step-card">
        <div class="step-image-wrapper">
          <img src="/images/booking-phone.jpg" 
               alt="احجز جلستك" 
               class="step-image"
               loading="lazy">
          <div class="step-number">١</div>
        </div>
        <h3 class="step-title">احجز جلستك</h3>
        <p class="step-description">
          رسالة واتساب سريعة.<br>
          ابحث عن وقت مناسب.
        </p>
      </div>
      
      <div class="step-card">
        <div class="step-image-wrapper">
          <img src="/images/video-call.jpg" 
               alt="تواصل واستكشف" 
               class="step-image"
               loading="lazy">
          <div class="step-number">٢</div>
        </div>
        <h3 class="step-title">تواصل واستكشف</h3>
        <p class="step-description">
          أين أنت الآن.<br>
          أين تريد أن تكون.<br>
          ما الذي يعيقك.
        </p>
      </div>
      
      <div class="step-card">
        <div class="step-image-wrapper">
          <img src="/images/journal-writing.jpg" 
               alt="اتخذ إجراءً" 
               class="step-image"
               loading="lazy">
          <div class="step-number">٣</div>
        </div>
        <h3 class="step-title">اتخذ إجراءً</h3>
        <p class="step-description">
          خطوات عملية تالية.<br>
          تقدم حقيقي.<br>
          ليس فقط مشاعر جيدة.
        </p>
      </div>
    </div>
  </div>
</section>

<style>
.how-it-works {
  padding: clamp(4rem, 8vw, 8rem) 0;
  background: var(--bg-secondary);
}

.how-it-works[dir="rtl"] {
  font-family: 'Cairo', 'Tajawal', sans-serif;
}

.steps-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 3rem;
  margin-top: 3rem;
}

.step-card {
  text-align: center;
  padding: 0;
  border-radius: 20px;
  background: white;
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
  overflow: hidden;
}

[data-theme="dark"] .step-card {
  background: #2d2d2d;
}

.step-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
}

.step-image-wrapper {
  position: relative;
  width: 100%;
  height: 220px;
  overflow: hidden;
}

.step-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.4s ease;
}

.step-card:hover .step-image {
  transform: scale(1.05);
}

.step-number {
  position: absolute;
  top: 20px;
  left: 20px;
  width: 60px;
  height: 60px;
  background: #25D366;
  color: white;
  font-size: 1.75rem;
  font-weight: 800;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 0 6px 25px rgba(37, 211, 102, 0.4);
  transition: all 0.3s ease;
}

.step-card:hover .step-number {
  transform: scale(1.15) rotate(8deg);
}

.step-title {
  font-size: clamp(1.4rem, 3vw, 1.65rem);
  font-weight: 700;
  color: var(--text-primary);
  margin: 1.5rem 1.5rem 1rem;
  transition: color 0.3s ease;
}

.step-card:hover .step-title {
  color: #25D366;
}

.step-description {
  font-size: 1.05rem;
  color: var(--text-secondary);
  line-height: 1.8;
  margin: 0 1.5rem 2rem;
}

@media (max-width: 768px) {
  .steps-grid {
    grid-template-columns: 1fr;
    gap: 2.5rem;
  }
  
  .step-image-wrapper {
    height: 200px;
  }
  
  .step-number {
    width: 50px;
    height: 50px;
    font-size: 1.5rem;
  }
}
</style>
HTML4

git add static/images/*.jpg layouts/partials/*.html
git commit -m "Host images locally - download from Unsplash

Downloaded and committed:
- stuck-forest-path.jpg (forest fork)
- overthinking-stress.jpg (hands on face)
- exhausted-couch.jpg (tired on couch)
- booking-phone.jpg (phone apps)
- video-call.jpg (video conversation)
- journal-writing.jpg (writing in journal)

All images now served from /images/ path"

git push origin main

echo ""
echo "✅ COMPLETE - Images downloaded and hosted locally"
echo "   Site will rebuild with working images"
