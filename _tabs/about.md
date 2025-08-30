---
# the default layout is 'page'
icon: fas fa-info-circle
order: 4
title: "About UPSC • द्विभाषी"
---
<!-- INSERT THIS where your page body/main should go.
     (Assumes you already have header/topbar with buttons:
       <button id="btn-en">English</button> and <button id="btn-hi">हिंदी</button>
     and a container style class `.wrap` in your existing head/css.) -->

<main class="wrap" id="upsc-about-main">
  <!-- English Content -->
  <article id="content-en" lang="en">
    <h1>About UPSC</h1>
    <p class="muted">Union Public Service Commission (UPSC) is India’s premier constitutional body that conducts examinations to recruit for the nation’s most prestigious civil and allied services.</p>

    <section class="card">
      <h2>Why UPSC Matters</h2>
      <p>Beyond a competitive exam, UPSC is a pathway to public service and nation-building. Officers contribute to policy, governance, law &amp; order, sustainable development, and citizens’ welfare with high integrity and accountability.</p>
    </section>

    <section class="grid">
      <div class="card">
        <h2>Major Examinations by UPSC</h2>
        <ul>
          <li><strong>Civil Services Examination (CSE)</strong> — IAS, IPS, IFS, IRS and other central services</li>
          <li>Combined Defence Services (CDS)</li>
          <li>National Defence Academy (NDA)</li>
          <li>Engineering Services Examination (ESE)</li>
          <li>Indian Forest Service (IFoS)</li>
        </ul>
      </div>

      <div class="card">
        <h2>CSE Structure</h2>
        <ol>
          <li><strong>Prelims</strong> — Objective (MCQs)</li>
          <li><strong>Mains</strong> — Descriptive papers</li>
          <li><strong>Interview</strong> — Personality Test</li>
        </ol>
      </div>
    </section>

    <section class="card">
      <h2>Preparation Journey</h2>
      <ul>
        <li>Build strong basics with NCERTs; move to standard texts.</li>
        <li>Stay consistent with newspapers and current affairs.</li>
        <li>Practice answer writing and self-review regularly.</li>
        <li>Adopt a realistic timetable and test-series discipline.</li>
      </ul>
      <p class="muted">This website curates syllabus, notes, PYQs, resources, and strategic guidance to streamline your preparation.</p>
    </section>
  </article>

  <!-- Hindi Content -->
  <article id="content-hi" lang="hi" class="sr-only">
    <h1>UPSC के बारे में</h1>
    <p class="muted">संघ लोक सेवा आयोग (UPSC) भारत का सर्वोच्च संवैधानिक निकाय है, जो देश की प्रतिष्ठित सिविल एवं अन्य सेवाओं के लिए परीक्षाएँ आयोजित करता है।</p>

    <section class="card">
      <h2>UPSC क्यों महत्वपूर्ण है</h2>
      <p>यह केवल प्रतिस्पर्धी परीक्षा नहीं, बल्कि जनसेवा और राष्ट्र-निर्माण का मार्ग है। अधिकारी नीति-निर्माण, प्रशासन, कानून-व्यवस्था, सतत विकास और जनकल्याण में ईमानदारी व उत्तरदायित्व के साथ योगदान देते हैं।</p>
    </section>

    <section class="grid">
      <div class="card">
        <h2>UPSC की प्रमुख परीक्षाएँ</h2>
        <ul>
          <li><strong>सिविल सेवा परीक्षा (CSE)</strong> — IAS, IPS, IFS, IRS एवं अन्य केंद्रीय सेवाएँ</li>
          <li>संयुक्त रक्षा सेवा (CDS)</li>
          <li>राष्ट्रीय रक्षा अकादमी (NDA)</li>
          <li>अभियांत्रिकी सेवा परीक्षा (ESE)</li>
          <li>भारतीय वन सेवा (IFoS)</li>
        </ul>
      </div>

      <div class="card">
        <h2>CSE संरचना</h2>
        <ol>
          <li><strong>प्रारंभिक परीक्षा</strong> — वस्तुनिष्ठ (MCQs)</li>
          <li><strong>मुख्य परीक्षा</strong> — वर्णात्मक प्रश्नपत्र</li>
          <li><strong>साक्षात्कार</strong> — पर्सनैलिटी टेस्ट</li>
        </ol>
      </div>
    </section>

    <section class="card">
      <h2>तैयारी की यात्रा</h2>
      <ul>
        <li>NCERT से ठोस आधार बनाकर मानक पुस्तकों तक जाएँ।</li>
        <li>अखबार और समसामयिक घटनाओं पर निरंतर फोकस रखें।</li>
        <li>उत्तर लेखन और आत्ममूल्यांकन का नियमित अभ्यास करें।</li>
        <li>यथार्थपरक टाइमटेबल और टेस्ट-सीरीज़ अनुशासन अपनाएँ।</li>
      </ul>
      <p class="muted">यह वेबसाइट सिलेबस, नोट्स, PYQs, संसाधन और रणनीतिक मार्गदर्शन एक जगह उपलब्ध कराती है।</p>
    </section>
  </article>
</main>

<!-- LANGUAGE SWITCHER SCRIPT: place just before </body> -->
<script>
  (function(){
    // assumes header has buttons with these IDs
    const btnEN = document.getElementById('btn-en');
    const btnHI = document.getElementById('btn-hi');
    const en = document.getElementById('content-en');
    const hi = document.getElementById('content-hi');

    // fallback: if buttons missing, create simple toggles (non-invasive)
    function ensureButtons(){
      if(!btnEN || !btnHI){
        const top = document.body;
        const wrapper = document.createElement('div');
        wrapper.style.cssText = 'position:fixed;right:12px;bottom:12px;z-index:9999;display:flex;gap:8px';
        const e = document.createElement('button'); e.id='btn-en'; e.textContent='EN'; e.className='btn';
        const h = document.createElement('button'); h.id='btn-hi'; h.textContent='HI'; h.className='btn';
        wrapper.appendChild(e); wrapper.appendChild(h);
        top.appendChild(wrapper);
        return {btnEN: e, btnHI: h};
      }
      return {btnEN, btnHI};
    }

    const btns = ensureButtons();
    const realBtnEN = btns.btnEN;
    const realBtnHI = btns.btnHI;

    function show(lang){
      const isEN = lang === 'en';
      en.classList.toggle('sr-only', !isEN);
      hi.classList.toggle('sr-only', isEN);

      realBtnEN.classList.toggle('active', isEN);
      realBtnHI.classList.toggle('active', !isEN);
      realBtnEN.setAttribute('aria-pressed', String(isEN));
      realBtnHI.setAttribute('aria-pressed', String(!isEN));

      document.documentElement.setAttribute('lang', isEN ? 'en' : 'hi');
      try{ localStorage.setItem('upsc_lang', isEN ? 'en' : 'hi'); }catch(e){}
    }

    // restore preference or default to English
    let pref = 'en';
    try{
      const saved = localStorage.getItem('upsc_lang');
      if(saved === 'hi' || saved === 'en') pref = saved;
    }catch(e){}
    show(pref);

    realBtnEN.addEventListener('click', ()=>show('en'));
    realBtnHI.addEventListener('click', ()=>show('hi'));
  })();
</script>
