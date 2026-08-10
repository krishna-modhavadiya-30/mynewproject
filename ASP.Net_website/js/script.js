document.addEventListener('DOMContentLoaded', function () {
  const backToTop = document.getElementById('backToTop');
  const currentPage = window.location.pathname.split('/').pop().toLowerCase();

  if (backToTop) {
    window.addEventListener('scroll', function () {
      if (window.scrollY > 300) {
        backToTop.style.display = 'flex';
        backToTop.style.alignItems = 'center';
        backToTop.style.justifyContent = 'center';
      } else {
        backToTop.style.display = 'none';
      }
    });

    backToTop.addEventListener('click', function () {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });
  }

  document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
    anchor.addEventListener('click', function (e) {
      const target = document.querySelector(this.getAttribute('href'));
      if (target) {
        e.preventDefault();
        target.scrollIntoView({ behavior: 'smooth' });
      }
    });
  });

  // Unified auth detection + redirect (safe for file:// and avoids redirect loops)
  let urlParamsSafe, authParamSafe, localAuthSafe, isAuthSafe;
  try {
    urlParamsSafe = new URLSearchParams(window.location.search);
  } catch (e) {
    urlParamsSafe = { get: () => null };
  }
  try {
    authParamSafe = urlParamsSafe.get('auth');
  } catch (e) {
    authParamSafe = null;
  }
  try {
    localAuthSafe = !!localStorage.getItem('libraryAdminAuth');
  } catch (e) {
    localAuthSafe = false;
  }
  isAuthSafe = !!localAuthSafe || authParamSafe === '1';

  // Toggle elements marked as admin-only based on authentication state.
  (function toggleAdminOnly() {
    const adminEls = document.querySelectorAll('[data-admin-only]');
    adminEls.forEach((el) => {
      if (isAuthSafe) {
        el.classList.remove('d-none');
      } else {
        el.classList.add('d-none');
      }
    });
  })();

  // User login handling (separate from admin login)
  const userLoginForm = document.getElementById('userLoginForm');
  if (userLoginForm) {
    userLoginForm.addEventListener('submit', function (e) {
      e.preventDefault();
      const email = document.getElementById('userEmail').value.trim();
      const password = document.getElementById('userPassword').value.trim();
      const msg = document.getElementById('userLoginMessage');

      if (email && password) {
        try {
          localStorage.setItem('libraryUserAuth', 'true');
          localStorage.setItem('libraryUserEmail', email);
        } catch (e) {
          // ignore
        }
        window.location.replace('index.html');
      } else {
        if (msg) {
          msg.classList.remove('d-none');
          msg.textContent = 'Please provide email and password to login.';
        }
      }
    });
  }

  const userRegisterForm = document.getElementById('userRegisterForm');
  if (userRegisterForm) {
    userRegisterForm.addEventListener('submit', function (e) {
      e.preventDefault();
      const name = document.getElementById('registerName').value.trim();
      const email = document.getElementById('registerEmail').value.trim();
      const password = document.getElementById('registerPassword').value.trim();
      const msg = document.getElementById('userRegisterMessage');

      if (name && email && password) {
        try {
          const users = JSON.parse(localStorage.getItem('libraryUsers') || '[]');
          users.push({ name, email, password });
          localStorage.setItem('libraryUsers', JSON.stringify(users));
          localStorage.setItem('libraryUserAuth', 'true');
          localStorage.setItem('libraryUserEmail', email);
        } catch (e) {
          // ignore
        }
        window.location.replace('index.html');
      } else {
        if (msg) {
          msg.classList.remove('d-none');
          msg.textContent = 'Please complete all fields to register.';
        }
      }
    });
  }

  const logoutButtons = document.querySelectorAll('#logoutButton, #sidebarLogout');
  logoutButtons.forEach((button) => {
    button.addEventListener('click', function () {
      try {
        localStorage.removeItem('libraryAdminAuth');
        localStorage.removeItem('libraryAdminUser');
      } catch (e) {
        // ignore
      }
      // ensure we drop any query auth param too
      window.location.replace('Login.aspx');
    });
  });

  function showAdminModal() {
    const modalEl = document.querySelector('[id$="_adminLoginModal"], #adminLoginModal');
    if (modalEl && window.bootstrap) new bootstrap.Modal(modalEl).show();
  }

  // Trigger admin modal from dropdown button
  document.addEventListener('click', function (e) {
    if (e.target && (e.target.id === 'adminLoginBtn' || e.target.closest('#adminLoginBtn'))) {
      e.preventDefault();
      showAdminModal();
    }
  });

  // Clicking the brand opens admin login (per request) instead of navigating
  document.querySelectorAll('.navbar-brand').forEach((brand) => {
    brand.addEventListener('click', function (e) {
      e.preventDefault();
      showAdminModal();
    });
  });

  const addStockBookBtn = document.getElementById('addStockBookBtn');
  const stockModalEl = document.getElementById('stockModal');
  const stockForm = document.getElementById('stockForm');
  const bookStockTableBody = document.getElementById('bookStockTableBody');

  if (addStockBookBtn && stockModalEl) {
    addStockBookBtn.addEventListener('click', function () {
      const modal = new bootstrap.Modal(stockModalEl);
      modal.show();
    });
  }

  function getInventory() {
    const saved = localStorage.getItem('libraryInventory');
    if (!saved) {
      const defaultInventory = [
        { title: 'AI Essentials', category: 'Technology', quantity: 12 },
        { title: 'Medical Ethics', category: 'Medical', quantity: 5 },
        { title: 'World History', category: 'History', quantity: 8 }
      ];
      localStorage.setItem('libraryInventory', JSON.stringify(defaultInventory));
      return defaultInventory;
    }
    try {
      return JSON.parse(saved);
    } catch (e) {
      return [];
    }
  }

  function saveInventory(inventory) {
    try {
      localStorage.setItem('libraryInventory', JSON.stringify(inventory));
    } catch (e) {}
  }

  function refreshAvailabilityCards() {
    const inventory = getInventory();
    const totalStock = inventory.reduce((sum, book) => sum + (parseInt(book.quantity, 10) || 0), 0);
    const lowStock = inventory.filter((book) => parseInt(book.quantity, 10) > 0 && parseInt(book.quantity, 10) < 6).length;
    const outOfStock = inventory.filter((book) => parseInt(book.quantity, 10) === 0).length;

    const totalStockEl = document.getElementById('totalStockCount');
    const lowStockEl = document.getElementById('lowStockCount');
    const outOfStockEl = document.getElementById('outOfStockCount');

    if (totalStockEl) totalStockEl.textContent = totalStock;
    if (lowStockEl) lowStockEl.textContent = lowStock;
    if (outOfStockEl) outOfStockEl.textContent = outOfStock;
  }

  function buildInventoryTable() {
    const inventory = getInventory();
    if (!bookStockTableBody) return;
    bookStockTableBody.innerHTML = '';

    inventory.forEach((book) => {
      const qty = parseInt(book.quantity, 10) || 0;
      const status = qty === 0 ? 'Out of Stock' : qty < 6 ? 'Low Stock' : 'In Stock';
      const badgeClass = qty === 0 ? 'bg-danger-subtle text-danger' : qty < 6 ? 'bg-warning-subtle text-warning' : 'bg-success-subtle text-success';
      const row = document.createElement('tr');
      row.innerHTML = `
        <td>${book.title}</td>
        <td>${book.category}</td>
        <td>${qty}</td>
        <td><span class="badge ${badgeClass}">${status}</span></td>
        <td class="text-end">
          <button class="btn btn-sm btn-outline-secondary edit-book-btn">Edit</button>
          <button class="btn btn-sm btn-outline-danger delete-book-btn">Delete</button>
        </td>
      `;
      bookStockTableBody.appendChild(row);
    });
  }

  if (stockForm && bookStockTableBody) {
    buildInventoryTable();
    refreshAvailabilityCards();
    stockForm.addEventListener('submit', function (e) {
      e.preventDefault();
      const title = document.getElementById('stockTitle').value.trim();
      const category = document.getElementById('stockCategory').value.trim();
      const quantity = parseInt(document.getElementById('stockQuantity').value, 10) || 0;
      if (!title || !category || quantity < 1) return;
      const inventory = getInventory();
      inventory.push({ title, category, quantity });
      saveInventory(inventory);
      buildInventoryTable();
      refreshAvailabilityCards();
      const modal = bootstrap.Modal.getInstance(stockModalEl);
      if (modal) modal.hide();
      stockForm.reset();
    });

    const editStockModalEl = document.getElementById('editStockModal');
    const editStockForm = document.getElementById('editStockForm');
    let currentEditRowIndex = null;

    bookStockTableBody.addEventListener('click', function (e) {
      const deleteBtn = e.target.closest('.delete-book-btn');
      const editBtn = e.target.closest('.edit-book-btn');

      if (deleteBtn) {
        const row = deleteBtn.closest('tr');
        if (!row) return;
        const index = Array.from(bookStockTableBody.children).indexOf(row);
        const inventory = getInventory();
        inventory.splice(index, 1);
        saveInventory(inventory);
        buildInventoryTable();
        refreshAvailabilityCards();
      }

      if (editBtn && editStockModalEl) {
        const row = editBtn.closest('tr');
        if (!row) return;
        currentEditRowIndex = Array.from(bookStockTableBody.children).indexOf(row);
        const inventory = getInventory();
        const book = inventory[currentEditRowIndex];
        if (!book) return;
        document.getElementById('editStockTitle').value = book.title;
        document.getElementById('editStockCategory').value = book.category;
        document.getElementById('editStockQuantity').value = book.quantity;
        const modal = new bootstrap.Modal(editStockModalEl);
        modal.show();
      }
    });

    if (editStockForm && editStockModalEl) {
      editStockForm.addEventListener('submit', function (e) {
        e.preventDefault();
        if (currentEditRowIndex === null) return;
        const title = document.getElementById('editStockTitle').value.trim();
        const category = document.getElementById('editStockCategory').value.trim();
        const quantity = parseInt(document.getElementById('editStockQuantity').value, 10) || 0;
        if (!title || !category || quantity < 0) return;
        const inventory = getInventory();
        inventory[currentEditRowIndex] = { title, category, quantity };
        saveInventory(inventory);
        buildInventoryTable();
        refreshAvailabilityCards();
        const modal = bootstrap.Modal.getInstance(editStockModalEl);
        if (modal) modal.hide();
        currentEditRowIndex = null;
      });
    }
  }

  const searchInput = document.getElementById('bookSearchInput');
  const categoryFilter = document.getElementById('categoryFilter');
  const availabilityFilter = document.getElementById('availabilityFilter');
  const bookCards = document.querySelectorAll('.book-card');
  const noResultsMessage = document.getElementById('noResultsMessage');

  function filterBooks() {
    const searchText = searchInput ? searchInput.value.toLowerCase().trim() : '';
    const categoryValue = categoryFilter ? categoryFilter.value.toLowerCase() : '';
    const availabilityValue = availabilityFilter ? availabilityFilter.value.toLowerCase() : '';
    let visibleCount = 0;

    bookCards.forEach((card) => {
      const name = (card.dataset.name || '').toLowerCase();
      const author = (card.dataset.author || '').toLowerCase();
      const category = (card.dataset.category || '').toLowerCase();
      const isbn = (card.dataset.isbn || '').toLowerCase();
      const availability = (card.dataset.availability || '').toLowerCase();
      const searchTextValue = `${name} ${author} ${category} ${isbn} ${availability}`;
      const matchesSearch = searchTextValue.includes(searchText);
      const matchesCategory = !categoryValue || category.includes(categoryValue);
      const matchesAvailability = !availabilityValue || availability.includes(availabilityValue);

      const matches = matchesSearch && matchesCategory && matchesAvailability;
      card.style.display = matches ? 'block' : 'none';
      if (matches) visibleCount += 1;
    });

    if (noResultsMessage) {
      noResultsMessage.classList.toggle('d-none', visibleCount !== 0);
    }
  }

  if (searchInput) searchInput.addEventListener('input', filterBooks);
  if (categoryFilter) categoryFilter.addEventListener('change', filterBooks);
  if (availabilityFilter) availabilityFilter.addEventListener('change', filterBooks);

  const issueBookButton = document.getElementById('issueBookButton');
  if (issueBookButton) {
    issueBookButton.addEventListener('click', function (e) {
      e.preventDefault();
      alert('Book issue request has been recorded successfully.');
    });
  }

  const returnBookButton = document.getElementById('returnBookButton');
  if (returnBookButton) {
    returnBookButton.addEventListener('click', function (e) {
      e.preventDefault();
      alert('Book return request has been submitted successfully.');
    });
  }
});
