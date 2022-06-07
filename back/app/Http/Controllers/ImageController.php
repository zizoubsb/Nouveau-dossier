<?php

namespace App\Http\Controllers;

use App\Models\Image;
use Facade\FlareClient\Http\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
class ImageController extends Controller
{
    public function fetch($id){
        $image = Image::find($id);
        return Storage::download($image->url);
    }
    public function destroy_image($id)
    {
        $image = Image::find($id);

        if(!$image)
        {
            return response([
                'message' => 'image not found.'
            ], 403);
        }

        if($image->user_id != auth()->user()->id)
        {
            return response([
                'message' => 'Permission denied.'
            ], 403);
        }

        $image->delete();

        return response([
            'message' => 'Comment image.'
        ], 200);
    }
}
