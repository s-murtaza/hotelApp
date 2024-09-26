import { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import axios from "axios";
import ListingCard from "../components/ListingCard";

export default function WishlistPage() {
    const user = useSelector((state)=> state.user.user);
  const wishList = useSelector((state) => state.user?.user?.wishList || []);
  //("wishlist page wishlist:", wishList); // Array of roomIds
  const [wishlistItems, setWishlistItems] = useState([]);

  useEffect(() => {
    if (wishList.length > 0) {
      // Batch API call
      axios
        .post("http://localhost:3000/rooms/batch", { roomIds: wishList })
        .then((response) => {
          setWishlistItems(response.data);
        })
        .catch((error) => {
          console.error("Error fetching wishlist items:", error);
        });
    }
  }, [wishList]);

  return (
    <div className="flex flex-col items-center bg-neutral-100 pt-48">
      <h2 className="font-Arapey text-4xl text-orange-950 mb-6">
        Your Wishlist
      </h2>
      {!user?(<h2 className="tracking-wide">
        Log in to access your wishlist  
      </h2>):(
        <>
          {wishList.length === 0 ? (
            <h2 className="text-xl text-gray-500">No wishlist items</h2>
          ) : (
            <ul className="mx-auto w-fit">
              {wishlistItems.map((listing) => (
                <ListingCard key={listing.id} listing={listing} />
              ))}
            </ul>
          )}
        </>
      )}
      
    </div>
  );
}
