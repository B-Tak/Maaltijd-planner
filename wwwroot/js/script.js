document.getElementById('daysSelect').addEventListener('change', function ()
{
    const numberOfDays = parseInt(this.value);
    const loremContainer = document.getElementById('loremContainer');

    loremContainer.innerHTML = '';

    let i = 0;
    while (i < numberOfDays)
    {
        const p = document.createElement('p');
        p.textContent = 'Lorem';
        loremContainer.appendChild(p);
        i++;
    }
});