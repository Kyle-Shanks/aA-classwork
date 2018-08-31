import React from 'react';
import Clock from './frontend/clock';
import Tabs from './frontend/tabs';
import Weather from './frontend/weather';
import Autocomplete from './frontend/autocomplete';

const Root = () => {
  const tabs = [
    {
      title: 'One',
      content: 'Lorem ipsum dolor amet keffiyeh tote bag pariatur cold-pressed snackwave aesthetic enim post-ironic officia iceland la croix vegan. Bushwick sint hella iceland tofu gastropub, venmo shoreditch flannel copper mug neutra palo santo labore.'
    },
    {
      title: 'Two',
      content: 'Salvia brooklyn jean shorts vegan flannel tote bag. Non ut narwhal cornhole sint authentic next level letterpress austin freegan crucifix brooklyn cliche portland.'
    },
    {
      title: 'Three',
      content: 'Paleo slow-carb consectetur, poke viral pok pok bespoke shaman letterpress keytar mixtape est pour-over commodo chicharrones.'
    },
    {
      title: 'Four',
      content: 'Banjo craft beer twee, swag aute lyft keytar whatever tumblr readymade aesthetic in sriracha copper mug lumbersexual.'
    }
  ];
  const names = [
    "Asher", "Bailey", "Farrah", "Grant", "Henter", "Lillian", "Maximilias", "Niola", "Olmarq", "Preston", "Red", "Royce", "Shomar", "Sybil", "The Camerata", "Unknown", "Wave Tannegan", "Transistor"
  ];

  return(
    <div>
      <Clock />
      <Tabs  objects={tabs} />
      <Weather />
      <Autocomplete names={names} />
    </div>
  );
};

export default Root;
