import React from 'react';

const ItemDetail = (props) => {
  return (
    <div className="item-detail">
      <img className="item-img" src={props.item.image_url} />
      <p>{props.item.name}</p>
      <p>Price: {props.item.price}</p>
      <p>Happiness: {props.item.happiness}</p>
    </div>
  );
};

export default ItemDetail;
