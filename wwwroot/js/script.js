const daysSelect = document.getElementById('daysSelect');
const randomSelect = document.getElementById('Random');
const visSelect = document.getElementById('Vis');
const avgSelect = document.getElementById('AVG');
const ongezondSelect = document.getElementById('Ongezond');
const veganSelect = document.getElementById('Vegan');
const allSelects = [randomSelect, visSelect, avgSelect, ongezondSelect, veganSelect];

function updateOptions() {
    const totalDays = parseInt(daysSelect.value);
    const selectedValues = allSelects.map(select => parseInt(select.value));
    const sumSelectedValues = selectedValues.reduce((a, b) => a + b, 0);
    let remainingDays = totalDays - sumSelectedValues;

    allSelects.forEach(select => {
        const currentValue = parseInt(select.value);
        const maxOptionValue = Math.min(totalDays, remainingDays + currentValue);

        select.innerHTML = '';

        for (let i = 0; i <= maxOptionValue; i++) {
            const option = document.createElement('option');
            option.value = i;
            option.textContent = i;
            if (i === currentValue) {
                option.selected = true;
            }
            select.appendChild(option);
        }

        remainingDays += currentValue;
        remainingDays -= parseInt(select.value);
    });
}

function resetOptions() {
    const totalDays = parseInt(daysSelect.value);

    allSelects.forEach(select => {
        select.innerHTML = '';
        for (let i = 0; i <= totalDays; i++) {
            const option = document.createElement('option');
            option.value = i;
            option.textContent = i;
            select.appendChild(option);
        }
        select.value = 0;
    });
}

daysSelect.addEventListener('change', () => {
    resetOptions();
    updateOptions();
});
allSelects.forEach(select => select.addEventListener('change', updateOptions));

resetOptions();
updateOptions();